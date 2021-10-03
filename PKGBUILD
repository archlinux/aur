# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libuev
pkgver=2.4.0
pkgrel=1
pkgdesc='Lightweight event loop library'
arch=('x86_64')
url='https://github.com/troglobit/libuev'
license=('MIT')
depends=('glibc')
provides=('libuev.so=3-64')
conflicts=('libuev.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('671ce75d06b2620535171bfe1751db0511a19dfcc791d4f0f0c3cb53bf237b3a')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
