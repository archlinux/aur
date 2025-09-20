# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Dreieck
# Contributor: Tomasz Zok

pkgname=pandoc-eisvogel-template
pkgver=3.2.1
pkgrel=1
pkgdesc="A clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX."
arch=('any')
url="https://github.com/Wandmalfarbe/pandoc-latex-template"
license=('BSD-3-Clause')
depends=('pandoc')
makedepends=('bash' 'git' 'tar' 'zip')
source=("git+$url#tag=v$pkgver")
sha512sums=('517781ec455a31abab2001543eadae86cc1edb5dd4c174bf94f5b8b93c68013093e4fb419faf745f246cead94e63899c17cc0ea29056a9bcc04d91f9ad490670')

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

