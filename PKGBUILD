# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bruce Zhang

pkgname=electron-fiddle
_pkgname=fiddle
pkgver=0.29.1
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=("$pkgname" "$pkgname")
source=("$_pkgname-$pkgver.src.tar.gz::https://github.com/electron/fiddle/archive/v$pkgver.tar.gz")
sha256sums=('26e71c1cd8f20619c8069c5a1eda5826781fafe53b82fdf66dad3874cabaef5f')

prepare() {
	local cache="$srcdir/npm-cache"
	local dist="/usr/lib/electron"

	cd "$srcdir/$_pkgname-$pkgver"

	# Fix dependencies
	sed -i 's#"monaco-editor": "^0.21.3"#"monaco-editor": "^0.17.0"#' "package.json"
	
	npm install --cache "$cache"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm run package
}

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
