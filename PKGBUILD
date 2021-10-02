# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Milian Reichardt <mreichardt95@gmail.com>

_pkgname=cpuminer-multi
pkgname=$_pkgname-git
pkgver=1.3.5.r32.gd2927ed
pkgrel=1
pkgdesc='Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0) - git version'
arch=('x86_64')
url="https://github.com/tpruvot/$_pkgname"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
makedepends=('git')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long | sed 's/^v//;s/-multi-\([0-9]*-g[0-9A-Fa-f]*\)$/-r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  CFLAGS+=' -Wa,--noexecstack'
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
