# Maintainer: Daniel Chen <danielchen04 at hotmail dot ca>

pkgname=noveldown-git
pkgver=r27.6dd094e
pkgrel=1
pkgdesc="Webnovel downloader and converter to EPUB as a Python library and command line application."
url="https://github.com/potatoeggy/noveldown"
replaces=()
arch=("any")
license=("LGPL3")
depends=(
	"python-requests"
	"python-typer"
	"python-beautifulsoup4"
	"python-lxml"
	"python-ebooklib"
)
makedepends=("git" "python-build" "python-installer")
provides=()
conflicts=()
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/noveldown"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/noveldown"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/noveldown"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
