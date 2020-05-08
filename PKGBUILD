# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.13.0
pkgrel=1
makedepends=('rust' 'cargo' 'python')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
# Use updpkgsums to update the checksum
sha256sums=('a07f730fa5dfe96ea3104b1cc13d2e72951a754870f22fb0dac6e30a359c6d8e')

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

