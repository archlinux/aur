# Maintainer: Nicholas Fraser <nicholas.rd.fraser@gmail.com>
pkgname=msgpack-tools
pkgver=0.6
pkgrel=1
pkgdesc="Command-line tools for converting between MessagePack and JSON"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/ludocode/msgpack-tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/ludocode/msgpack-tools/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('98c8b789dced626b5b48261b047e2124d256e5b5d4fbbabdafe533c0bd712834')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
