# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.5.0
pkgver_underscore=0_5_0
pkgrel=2
makedepends=('rustup')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver_underscore.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('46c9c0ba95c464c70c8a4c099962873e5baa1b9bee3413645a0cc245701047da')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver_underscore"

  cargo +beta install \
	--all-features \
	--locked \
	--root "${pkgdir}"/usr \
	--path "./" \
   || ( >&2 echo $'\nInstall Cargo Beta compiler:'\
		$'\n\n\trustup install beta    (no root required)'\
		$'\n\nThen try building nushell again.'\
       && false )
}

