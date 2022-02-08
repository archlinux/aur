# Maintainer: eggy <eggyrules at gmail dot com>

pkgname=mandown-git
pkgver=r78.259b9e6
pkgrel=1
pkgdesc="Comic downloader and EPUB/CBZ converter command line application and Python library"
url="https://github.com/potatoeggy/mandown"
replaces=()
arch=("any")
license=("AGPL3")
depends=(
	"python-requests"
	"python-typer"
	"python-feedparser"
	"python-beautifulsoup4"
	"python-natsort"
	"python-lxml"
)
makedepends=("git" "python-setuptools" "python-dephell")
optdepends=(
	"python-pillow: Image processing"
)
provides=()
conflicts=("mandown")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/mandown"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/mandown"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$srcdir/mandown"
    python setup.py build
}

package() {
    cd "$srcdir/mandown"
    python setup.py install --root="$pkgdir" --optimize=1
}
