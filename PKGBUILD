# Maintainer: ByteDream
pkgname=docker4ssh
pkgdesc="Docker containers and more via ssh"
arch=('x86_64')
url="https://github.com/ByteDream/docker4ssh"
license=('AGPL3')

pkgver=0.1.1
pkgrel=1

makedepends=(
  'go'
  'rustup'
  'sqlite3'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/docker4ssh/archive/v${pkgver}.tar.gz")
sha256sums=('fbcc69f8f40beb4376739d2ecb0878addc88ddf29fc2c510348b586a64fc7e51')

build() {
  rustup target add x86_64-unknown-linux-musl

  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
