# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Dreieck
# Contributor: Tomasz Zok

pkgname=pandoc-eisvogel-template
pkgver=3.3.0
pkgrel=1
pkgdesc="A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX."
arch=('any')
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('BSD-3-Clause')
depends=('pandoc')
makedepends=('bash' 'git' 'tar' 'zip')
source=("git+$url#tag=v$pkgver")
sha512sums=('756103b14aacd070eedea78bb9ed8cd0268fcd4eef2927d5d62e7a8324f28f2c5e43d4734baaf810f942f792fbb40cb9a8544e470265740891f83f910a557a09')

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
	cp -r docs examples "$pkgdir/usr/share/doc/$pkgname/"
	chmod a+x "$pkgdir/usr/share/doc/$pkgname/examples/"*/*.sh
}

