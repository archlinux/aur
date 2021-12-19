# Maintainer: ByteDream
pkgname=docker4ssh
pkgdesc="Docker containers and more via ssh"
arch=('x86_64')
url="https://github.com/ByteDream/docker4ssh"
license=('AGPL3')

pkgver=0.1.0
pkgrel=1

makedepends=(
  'go'
  'rustup'
  'sqlite3'
  'make'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/docker4ssh/archive/v${pkgver}.tar.gz")
sha256sums=('c895e5bdf1f05fb93e07775a3776384ec2cc5472fbaa859dc092820ec7a6f955')

build() {
  rustup target add x86_64-unknown-linux-musl

  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
