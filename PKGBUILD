# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=tilp-git
pkgver=1.18.r25.g4fdd6bd0
pkgrel=2
pkgdesc="TI graphing calculator link/transfer program"
groups=("knightos")
arch=('i686' 'x86_64')
url="https://github.com/adriweb/tilp_and_gfm/tree/gtk3"
license=('GPL2')
depends=('gtk3' 'libticalcs')
makedepends=('intltool')
optdepends=('gfm: to manage and manipulate TI Group Files (backups)')
source=("$pkgname::git+https://github.com/adriweb/tilp_and_gfm.git#branch=gtk3")
md5sums=('SKIP')
provides=('tilp')
conflicts=('tilp')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  #cd "${srcdir}/tilp2-${pkgver}"
  cd "${srcdir}/${pkgname}/tilp/trunk"

  #patch -Np1 < "${srcdir}/remove-broken-kde-support.patch"
}

build() {
  #cd "${srcdir}/tilp2-${pkgver}"
  cd "${srcdir}/${pkgname}/tilp/trunk"

#  mkdir -p build
#  cd build
  
#  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
#  cmake --build ..
  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/tilp/trunk"
  #cd "${srcdir}/tilp2-${pkgver}"

  #make --install ..
  make install DESTDIR="${pkgdir}"
}
