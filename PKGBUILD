# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.10.2
pkgrel=1
pkgdesc="A very fast and convenient image viewer"
url="https://userbase.kde.org/KuickShow"
arch=('x86_64')
license=('GPL')
depends=('hicolor-icon-theme' 'imlib' 'qt5-base' 'qt5-x11extras'
         'kdoctools' 'ki18n' 'kiconthemes' 'kio' 'kxmlgui' 'kinit')
makedepends=('cmake' 'docbook-xsl' 'extra-cmake-modules')
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz) #{,.sig})
# validpgpkeys=('285ABEE99DADA2A7') #Unknown key - gpg: keyserver receive failed: No data
sha256sums=('5acecd64e9e9fe4d093665a2768e5c7d05c1845c572c7e36243bfd6cd4575357')

build() {
  cd "${srcdir}"

  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=YES
  make
}

package(){
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install
}
