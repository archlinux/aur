# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Dreieck
# Contributor: Tomasz Zok

pkgname=pandoc-eisvogel-template
pkgver=3.2.0
pkgrel=1
pkgdesc="A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX."
arch=('any')
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('BSD-3-Clause')
depends=('pandoc')
makedepends=('bash' 'git' 'tar' 'zip')
source=("git+$url#tag=v$pkgver")
sha512sums=('9c694d93d3cc53e676ae3baa2139cc339fcb22778b55865ea6514e5b62028a2c66685be5beb71049689604f4c08a4ba6eea1d613d7d671e296f2d12215bc7a54')

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

	install -D CHANGELOG.md README.md icon.png icon.svg .texlife.profile \
		-t "$pkgdir/usr/share/doc/$pkgname/"
	cp -r docs examples "$pkgdir/usr/share/doc/$pkgname/"
	chmod a+x "$pkgdir/usr/share/doc/$pkgname/examples/"*/*.sh
}

