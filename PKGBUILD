# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Dreieck
# Contributor: Tomasz Zok

pkgname=pandoc-eisvogel-template
pkgver=3.4.0
pkgrel=1
pkgdesc="A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX."
arch=('any')
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('BSD-3-Clause')
depends=('pandoc')
makedepends=('bash' 'git' 'tar' 'zip')
source=("git+$url#tag=v$pkgver")
sha512sums=('707045d3f54eaabf0ae2edad7efaf5c0cc85a22906c8519fc3b80bb5c025a8dee81abf30e2a10fe29f2b4ca88b0186742a51558b1642b7b6ca0dee7b93204ea1')

prepare() {
	chmod u+x pandoc-latex-template/tools/release.sh
}

build() {
	cd pandoc-latex-template
	tools/release.sh
}

package() {
	cd pandoc-latex-template
	install -D dist/eisvogel.{latex,beamer} -t "$pkgdir/usr/share/pandoc/data/templates/"
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -D CHANGELOG.md README.md icon.png icon.svg \
		-t "$pkgdir/usr/share/doc/$pkgname/"
	install -D resources/texlive.profile "$pkgdir/usr/share/doc/$pkgname/.texlife.profile"
	cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
	chmod a+x "$pkgdir/usr/share/doc/$pkgname/examples/"*/*.sh
}
