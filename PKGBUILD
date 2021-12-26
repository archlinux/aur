# Maintainer: ByteDream
pkgname=docker4ssh
pkgdesc="Docker containers and more via ssh"
arch=('x86_64')
url="https://github.com/ByteDream/docker4ssh"
license=('AGPL3')

pkgver=0.1.2
pkgrel=1

makedepends=(
  'go'
  'rustup'
  'sqlite'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/docker4ssh/archive/v${pkgver}.tar.gz")
sha256sums=('5a4b3ec49c697147b2cbe504c4bc6057a30fa8cb2e2465d83f75cd4895f8b534')

build() {
  rustup target add x86_64-unknown-linux-musl

  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
