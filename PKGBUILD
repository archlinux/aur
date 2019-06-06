# Maintainer: David Runge <dave@sleepmap.de>
pkgname=osmid
pkgver=0.6.4
pkgrel=1
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=('x86_64')
url="https://github.com/llloret/osmid"
license=('GPL2' 'MIT')
groups=('pro-audio')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cmake' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/llloret/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e645c7e1140a348adb696ac8dd582cd75024d94e9a4ec18a4355c5e6737396d7cb2dbf977a8e47f17e10efcedf020017dded6bcd3e31442967d46be2f8eb00b9')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -v build
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  # license
  install -vDm 644 ../LICENSE.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # docs
  install -vDm 644 ../README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
