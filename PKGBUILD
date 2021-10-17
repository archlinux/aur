# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt5-avif-image-plugin
_pkgname=qt-avif-image-plugin
pkgver=0.4.5
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt and KDE based applications to read/write AVIF images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('BSD')
depends=('libavif' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules')
checkdepends=('appstream')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        'avifthumbnail.desktop')
sha256sums=('03f76c949637aa27da054045badfce9bfee7747ba700af974519e0c2e938f7e1'
            '909c0b92ff504a6b125d3e73e7500900e0def24e4b27f4c961e40c992bfaf83b')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  make -C build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 avifthumbnail.desktop -t "$pkgdir/usr/share/kservices5"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
