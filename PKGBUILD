# Maintainer: Robin McCorkell <robin@mccorkell.me.uk>
pkgname=pandoc-plantuml-filter-git
pkgver=0.1.0.2
pkgrel=1
pkgdesc="Pandoc filter for PlantUML code blocks"
arch=('any')
url="https://github.com/kbonne/pandoc-plantuml-filter"
license=('GPL2')
depends=(pandoc plantuml)
makedepends=(git cabal-install haskell-pandoc-types)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'git+https://github.com/kbonne/pandoc-plantuml-filter.git'
	'cabal.patch'
)
md5sums=(
	'SKIP'
	'38558ee9e9dddd252f5c46d0e8e273a6'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/cabal.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cabal build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D dist/build/pandoc-plantuml-filter/pandoc-plantuml-filter "$pkgdir"/usr/bin/pandoc-plantuml-filter
}
