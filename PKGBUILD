# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.8.0
pkgrel=1
makedepends=('rust')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
# Use updpkgsums to update the checksum
sha256sums=('fada2e350efdf0e730469ab503499b76ab97326bf6e8fc7ffc5db99a4c311ce6')

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

