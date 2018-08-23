# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgbase=fonts-et-book
_pkgbase=et-book
pkgname=(
	fonts-et-book
	otf-et-book
	ttf-et-book
	type1-et-book
)
pkgver=20151005
pkgrel=1
pkgdesc="A typeface used in Edward Tufte's books"
arch=(any)
url="https://edwardtufte.github.io/et-book"
license=(MIT)
makedepends=(git)
source=("et-book::git+https://github.com/edwardtufte/et-book.git#commit=5cadf4d"
        "et-book-ligatures::git+https://github.com/adactio/et-book.git#commit=65f7802"
        "LICENSE::https://raw.githubusercontent.com/edwardtufte/et-book/gh-pages/LICENSE")
sha256sums=('SKIP'
            'SKIP'
            '5ce4d24bc1aeed06dd19a43588702f434392ea79df28111f3149bb809504fa26')

package_fonts-et-book() {
	pkgdesc="A typeface used in Edward Tufte's books (all types)"
	depends=('otf-et-book' 'ttf-et-book' 'type1-et-book')
}

package_otf-et-book() {
	pkgdesc="A typeface used in Edward Tufte's books (OTF)"

	mkdir -p "${pkgdir}"/usr/share/fonts/OTF/${_pkgbase}
	find ${_pkgbase}-ligatures/et-book-ligatures-enabled -type f -name "*.otf" -exec \
		install -m644 {} "${pkgdir}"/usr/share/fonts/OTF/${_pkgbase} \;
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_ttf-et-book() {
	pkgdesc="A typeface used in Edward Tufte's books (TTF)"

	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgbase}
	install -m644 ${_pkgbase}/source/4-ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgbase}
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_type1-et-book() {
	pkgdesc="A typeface used in Edward Tufte's books (Type1)"

	mkdir -p "${pkgdir}"/usr/share/fonts/Type1/${_pkgbase}
	install -m644 ${_pkgbase}/source/3-pfb/*.pfb "${pkgdir}"/usr/share/fonts/Type1/${_pkgbase}
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
