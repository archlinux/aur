# Maintainer: n0vella <n0vella@outlook.com>
pkgname=cardo-git
_pkgname=cardo
pkgver=1.6.0
pkgrel=1
pkgdesc="Cardo podcast client"
arch=('x86_64')
url="https://github.com/cardo-podcast/cardo/"
license=('GPL-3.0-or-later')
groups=()
depends=('gtk3' 'webkit2gtk' 'sqlite')
makedepends=('git' 'cargo' 'pnpm' 'nodejs')
options=('!lto') # https://github.com/toeverything/AFFiNE/issues/6280#issuecomment-2041484627
provides=("cardo")
conflicts=("cardo")
source=("git+$url")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --abbrev=0
}

prepare() {
	cd "$srcdir/${_pkgname}"
	pnpm i
}

build() {
	cd "$srcdir/${_pkgname}"
	pnpm run tauri build -b 'deb'
}


package() {
 	cp -rT "$srcdir/${_pkgname}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_amd64/data" "$pkgdir"
}
