# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=ugene-git
pkgver=33.0.r1412.gacffc816ae
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('x86_64')
url="http://ugene.unipro.ru/"
license=('GPL')
depends=('libxtst' 'glu' 'qt5-webkit' 'qt5-websockets' 'qt5-svg' 'qt5-script' 'desktop-file-utils' 'qspec-git')
makedepends=('git')
provides=('ugene' 'ugene-bin')
conflicts=('ugene' 'ugene-bin')
replaces=('ugene' 'ugene-bin')
source=('ugene::git+https://github.com/ugeneunipro/ugene.git')
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/ugene
  #make sure that the wanted branch is active
  git checkout master
  CXXFLAGS="$CXXFLAGS -Wno-depreceated"
  qmake CONFIG+=x64 PREFIX=/usr -r
  make
}

pkgver() {
  cd "${srcdir}"/ugene
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
  cd "${srcdir}"/ugene
  make INSTALL_ROOT="$pkgdir" install
}

post_install() {
  update-desktop-database -q
}
post_remove() {
  update-desktop-database -q
}
 
