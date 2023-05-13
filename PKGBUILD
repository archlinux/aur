# Maintainer: HurricanePootis <hurricanepooits@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

## GPG keys: https://github.com/randy408.gpg
## Note that they expired in 2020

pkgname=libspng
pkgver=0.7.4
pkgrel=1
pkgdesc='Simple, modern libpng alternative'
arch=('x86_64' 'aarch64')
url='https://github.com/randy408/libspng'
license=('BSD')
depends=('zlib')
makedepends=('git' 'meson')
provides=("$pkgname.so")
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('4570C3DB9C3B37ABCC9086CB3EBDF887C2E2C548') ## Randy

build() {
	arch-meson build "$pkgname"
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
