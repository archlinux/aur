# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: giacomogiorgianni@gmail.com

pkgname=boomaga
pkgver=3.0.0
pkgrel=1
pkgdesc="Virtual printer for viewing a document before printing it out using the physical printer"
arch=(x86_64 aarch64)
url="https://www.boomaga.org/"
license=(GPL2 LGPL2.1)
depends=(qt5-base poppler)
makedepends=(cmake qt5-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Boomaga/boomaga/archive/v${pkgver}.tar.gz")
sha256sums=('74af10ec5a78008d335011eca0f63ed7ccd4bc2fdac2f4cffa73db7acc05e767')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. -Wno-dev \
    -DBUILD_TESTS=Yes \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
  #install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/installPrinter.sh" "${pkgdir}/usr/bin/"
}
