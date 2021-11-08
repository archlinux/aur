# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt5-avif-image-plugin
_pkgname=qt-avif-image-plugin
pkgver=0.4.6
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write AVIF images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('BSD')
depends=('libavif' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules')
checkdepends=('appstream')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        'avifthumbnail.desktop')
sha256sums=('c015513d0d6322710ee756ab5185d95d3c2ba0988519e4e9b518fb92ad855acd'
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
