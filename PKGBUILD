# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=ugene-git
pkgver=1.31.0.qt.5.7.r284.g7a9e8fb0b
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('x86_64')
url="http://ugene.unipro.ru/"
license=('GPL')
depends=('libxtst' 'glu' 'qt5-webkit' 'qt5-svg' 'qt5-script' 'desktop-file-utils')
provides=('ugene' 'ugene-bin')
conflicts=('ugene' 'ugene-bin')
replaces=('ugene' 'ugene-bin')
source=('ugene::git+https://github.com/ugeneunipro/ugene.git#branch=master')
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/ugene
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
 
