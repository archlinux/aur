# Maintainer: Daniel Chen <danielchen04 at hotmail dot ca>

pkgname=python-comicon-git
pkgver=r34.53ea21d
pkgrel=1
pkgdesc="Lightweight comic converter library between CBZ, PDF and EPUB"
url="https://github.com/potatoeggy/comicon"
replaces=()
arch=("any")
license=("AGPL3")
depends=(
	"python-ebooklib"
	"python-pillow"
	"python-lxml"
	"python-pypdf"
)
makedepends=("git" "python-build" "python-installer" "python-poetry-core" "python-pytest")
provides=("python-comicon" "comicon")
conflicts=()
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/comicon"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/comicon"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/comicon"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
