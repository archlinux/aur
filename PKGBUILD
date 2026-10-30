pkgname=anna-git
gitname=annas-archive-cli
pkgver=0.2.0rc4
pkgrel=1
pkgdesc="anna's archive cli"
arch=(any)
url=https://github.com/meurz/$gitname
license=(MIT)
depends=(
  python-beautifulsoup4
  python-click
  python-httpx
  python-socksio
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
)
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$gitname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$gitname"
  PYTHONPATH="$PWD/src" python -m pytest -q
}

package() {
  cd "$srcdir/$gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
