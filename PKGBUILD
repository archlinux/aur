# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.10.0
pkgrel=2
pkgdesc="A very fast and convenient image viewer"
url="https://userbase.kde.org/KuickShow"
arch=('x86_64')
license=('GPL')
depends=('hicolor-icon-theme' 'imlib' 'qt5-base' 'qt5-x11extras'
         'kdoctools' 'ki18n' 'kiconthemes' 'kio' 'kxmlgui' 'kinit')
makedepends=('cmake' 'docbook-xsl' 'extra-cmake-modules')
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz) #{,.sig})
# validpgpkeys=('285ABEE99DADA2A7') #Unknown key - gpg: keyserver receive failed: No data
sha256sums=('08bae0a3134579787bb8a6e4bb6439c5e6237ae6a990f411df6140b268f5d628')

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
