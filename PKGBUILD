# Maintainer: Maxime Tréca <maxime.treca@gmail.com>
pkgname=envypn-otb
pkgver=r5.f42ebe3
pkgrel=1
pkgdesc="A monospace bitmap font."
arch=('any')
url="https://github.com/hicolour/envypn-font"
license=('custom')
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git' 'fonttosfnt-git')
conflicts=('envypn-font')
makedepends=('git')
source=("$pkgname::git+https://github.com/hicolour/envypn-font")
md5sums=('SKIP')

_ex_pt() {
	_pt=${1%.bdf}
	_pt=${_pt#*-}
	echo $_pt
}

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	for f in *.bdf; do
		fonttosfnt -o "${f/bdf/otb}" "$f"
	done
}

package() {
	cd "$srcdir/${pkgname}"
	for i in *.otb; do
		install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
	done
}

