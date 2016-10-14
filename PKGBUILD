pkgname=crowbook-git
pkgver=0.10.0.826
pkgrel=1
pkgdesc="Render a Markdown book in HTML, PDF or Epub"
arch=('x86_64' 'i686')
url="https://github.com/lise-henry/crowbook"
license=('LGPL-2.1+')
depends=()
makedepends=('cargo' 'python-pytoml')
optdepends=(
	"zip: EPUB rendering requires that the zip command be present on your system"
	"texlive-bin: PDF rendering requires a working installation of LaTeX (preferably xelatex)"
	"languagetool: Grammar checking (for proofreading copies) requires LanguageTool"
)
provides=('crowbook')
conflicts=('crowbook')
source=($pkgname::git+https://github.com/lise-henry/crowbook.git)
md5sums=('SKIP')

pkgver() {
    cd $pkgname
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'].split('-')[0])").$(git rev-list --count HEAD)"
}

build() {
    cd $pkgname
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
