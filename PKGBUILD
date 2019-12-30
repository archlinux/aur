# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.7.0
pkgrel=3
makedepends=('rust')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
# Use updpkgsums to update the checksum
sha256sums=('9cfb6be335f7a06ccaf7cc2a06075a23ed6e2e2fdd6ea7fbc165a7d4a30990f9')

build() {
  cd "$pkgname-$pkgver"
  cargo build \
	--locked \
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

