# Maintainer: David Runge <dave@sleepmap.de>
pkgname=osmid
pkgver=0.6.8
pkgrel=2
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=('x86_64')
url="https://github.com/llloret/osmid"
license=('GPL2' 'MIT')
groups=('pro-audio')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cmake' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/llloret/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b0b5024c3894735968566ac7b5d93f67000dcaf65d4e41443cefc00561f2e0892a32b77fdb7a53db74b0732e7ca9d97653151f0f5aa9c32fae40be9396feba98')

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
