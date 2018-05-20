# Maintainer: David Runge <dave@sleepmap.de>
pkgname=osmid
pkgver=0.6.1
pkgrel=2
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=('x86_64')
url="https://github.com/llloret/osmid"
license=('GPL2' 'MIT')
groups=('pro-audio')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cmake' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/llloret/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('817a015872dae1108a4ac6823f8a342c43f38d5be2191dd41b70c583f0b01bc22d199c2648edf146ef4bdb9a1b4ac11a7fd8a460c4c3082f67ac1ff1b7bd4c5e')

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
