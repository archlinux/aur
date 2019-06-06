# Maintainer: David Runge <dave@sleepmap.de>
pkgname=osmid
pkgver=0.6.5
pkgrel=1
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=('x86_64')
url="https://github.com/llloret/osmid"
license=('GPL2' 'MIT')
groups=('pro-audio')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cmake' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/llloret/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('dd5e8db519cade60e5847ee02d9d19ac1b70ebfbc91eaefd0022382fdde3a6a924b73ec1683f350b348ba1343d0bb6405543722528660e69414d49132273f3ad')

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
