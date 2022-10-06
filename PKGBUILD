# Maintainer: Daniel Chen <danielchen04 at hotmail dot ca>

pkgname=mandown-git
pkgver=r147.3a9334d
pkgrel=1
pkgdesc="Comic/manga/webtoon downloader and converter to CBZ/EPUB/PDF"
url="https://github.com/potatoeggy/mandown"
replaces=()
arch=("any")
license=("GPL2")
depends=(
	"python-requests"
	"python-typer"
	"python-feedparser"
	"python-beautifulsoup4"
	"python-slugify"
	"python-lxml"
	"python-natsort"
)
makedepends=("git" "python-build" "python-installer")
optdepends=(
	"python-pillow: Image processing"
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
