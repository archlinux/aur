# Maintainer: MeIsGaming <info@meisgaming.net>
pkgname=gucken-git
pkgver=r70.g7da7a6e
pkgrel=1
pkgdesc="Terminal-based media viewer"
arch=('any')
url="https://github.com/Commandcracker/gucken"
license=('MIT')
depends=(
  'python'
  'python-async-lru'
  'python-fuzzywuzzy'
  'python-pypresence'
  'python-rich'
  'python-textual'
  'python-textual-image'
  'python-rich-argparse'
  'python-beautifulsoup4'
  'python-httpx'
  'python-packaging'
  'python-platformdirs'
  'python-toml'
  'python-linkify-it-py'
  'python-h2'
  'python-mpv'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-hatchling'
)
optdepends=(
  'python-levenshtein: faster fuzzy matching'
  'python-orjson: faster json parsing'
)
provides=('gucken')
conflicts=('gucken')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gucken"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/gucken"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/gucken"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
