# Maintainer: Daniel Chen <danielchen04 at hotmail dot ca>

pkgname=mandown-git
pkgver=r211.e85a310
pkgrel=1
pkgdesc="Comic/manga/webtoon downloader and CBZ/EPUB/PDF converter"
url="https://github.com/potatoeggy/mandown"
replaces=()
arch=("any")
license=("AGPL3")
depends=(
	"python-requests"
	"python-typer"
	"python-feedparser"
	"python-beautifulsoup4"
	"python-slugify"
	"python-lxml"
	"python-natsort"
	"python-filetype"
	"python-comicon"
	"python-pillow"
)
makedepends=("git" "python-build" "python-installer" "python-poetry-core")
optdepends=(
	"pyside6: Graphical interface"
)
provides=()
conflicts=("mandown")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/mandown"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/mandown"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mandown"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
