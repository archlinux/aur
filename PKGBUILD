# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sergiy Kukunin <sergey.kukunin@gmail.com>

pkgname=cpuminer-multi
_commit=04666ea6d0d7e00e4d520640aac29db5bcd65353
pkgver=1.3.7
pkgrel=4
pkgdesc='Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0)'
arch=('x86_64')
url="https://github.com/tpruvot/$pkgname"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
makedepends=('git')
provides=('cpuminer')
conflicts=('cpuminer')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  CFLAGS+=' -Wa,--noexecstack'
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
