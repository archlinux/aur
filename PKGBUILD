# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.14.0
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
sha256sums=('8084bb21433aa3598475470abf78e6653440b51db2f28392212eee00238c3346')

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

