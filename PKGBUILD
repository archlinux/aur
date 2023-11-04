# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=prison
pkgname=${_name}5
pkgver=5.112.0
pkgrel=1
pkgdesc='A barcode API to produce QRCode barcodes and DataMatrix barcodes'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(GPL)
depends=(qt5-multimedia libdmtx qrencode zxing-cpp)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc qt5-declarative)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('783b0f7140936332373e4c6ebc60d85eebf5f3343e2d0c9cae7afc4926d08fae'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
