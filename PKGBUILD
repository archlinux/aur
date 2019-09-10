# Maintainer: Maxime Tréca <maxime.treca@gmail.com>
pkgname=gohufont-otb
pkgver=r8.cc36b8c
pkgrel=1
pkgdesc="A monospace bitmap font."
arch=('any')
url="https://github.com/hchargois/gohufont"
license=('custom')
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git' 'fonttosfnt-git')
conflicts=('gohufont')
makedepends=('git')
source=("$pkgname::git+https://github.com/hchargois/gohufont.git")
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
