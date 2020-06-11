# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

_pkgname=nu
pkgname=${_pkgname}shell
pkgver=0.15.0
pkgrel=1
pkgdesc="A new type of shell."
arch=('any')
url="https://www.nushell.sh"
license=('MIT')
depends=('openssl' 'zlib' 'e2fsprogs')
makedepends=('rust' 'cargo' 'python')
optdepends=('libxcb' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
# Use updpkgsums to update the checksum
sha256sums=('f19e580b645ff047e3b7cb2e0823654e020cd5c62b22e601caf6be579204dc2a')

build() {
  cd "$pkgname-$pkgver"
  cargo build \
	--locked \
	--features=stable \
	--release 
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -m 755 "{}" "$pkgdir"/usr/bin \;
}

