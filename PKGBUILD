# Maintainer: Matteo Triggiani <davvore33@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=protobuf2-c
pkgver=1.2.1
pkgrel=1
pkgdesc='Protocol Buffers implementation in C'
arch=('i686' 'x86_64')
url='https://github.com/protobuf-c/protobuf-c'
license=('BSD')
depends=('protobuf2')
conflicts=('protobuf-c')
provides=("libprotobuf-c.so=$pkgver")
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e544249c329391fff512c3874895cfbe')

build() {
  cd "$pkgname-$pkgver"
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
