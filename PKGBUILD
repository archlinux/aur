# Maintainer: lekker <bradyhickey at outlook dot com>

pkgname=geminidesk
_pkgname=gemini-desk
pkgver=7.0.0
pkgrel=1
pkgdesc="An unofficial Gemini client for desktop (built from latest release)"
arch=('x86_64')
url="https://github.com/hillelkingqt/GeminiDesk"
license=('MIT')
depends=('libxcrypt-compat')
makedepends=('nodejs>=16' 'npm')
conflicts=("geminidesk-bin" "geminidesk-git")
source=("despair.tar.gz::https://github.com/hillelkingqt/GeminiDesk/archive/refs/tags/v$pkgver.tar.gz"
		"package.json")
sha256sums=('2fc719fc581c5a9b8bfc81365477cbf1bbd9a7752a966468a6fe5b887cfa597b'
            'c34ef8e59db831e820f17f58539db3a0984eb11fb94ea306b2ee8426ac04ca6d')

prepare() {
	cd "$srcdir/GeminiDesk-$pkgver"
	mv ../package.json .
}

build() {
	cd "$srcdir/GeminiDesk-$pkgver"
	npm upgrade
	npm run build
}

package() {
	cd "$srcdir/GeminiDesk-$pkgver"
	ar p "dist/${_pkgname}_${pkgver}_amd64.deb" data.tar.xz | tar -xJ -C "$pkgdir"
}
