# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.12.0
pkgrel=1
pkgdesc="A simple password manager"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3')
depends=('libx11' 'libxmu' 'xsel' 'wl-clipboard')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkleinespel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8d9ee02c81330491517320cf89247c25329403ca06056d412edfb440a95da569')

build() {
  cd "$pkgname-$pkgver"
  sed -i 's# path = "../[a-z0-9]\+",##g' Cargo.toml
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
