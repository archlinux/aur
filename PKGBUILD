# Maintainer: David Runge <dave@sleepmap.de>
pkgname=osmid
pkgver=0.6.7
pkgrel=1
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=('x86_64')
url="https://github.com/llloret/osmid"
license=('GPL2' 'MIT')
groups=('pro-audio')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cmake' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/llloret/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('50b06658762445853222f9766767017dc6027a798307c45919d6928b28e55d19b6c1886144c4f952f042ef26d41b7fb07b535877ca09cacf4cadcbec336b28c8')

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
