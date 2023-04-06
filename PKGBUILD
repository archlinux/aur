
_pkgname="baca-ereader"
pkgname="$_pkgname-git"
pkgver=0.1.13.r0.g7bc856f
pkgrel=1
pkgdesc="TUI Ebook Reader"
arch=('any')
url="https://github.com/wustho/baca"
license=("GPL3")
provides=("$_pkgname")
conflicts=(${provides[@]})
depends=(
  'python-appdirs'
  'python-beautifulsoup4'
  'python-fuzzywuzzy'
  'python-peewee'
  'python-rich'

  # AUR
  'python-markdownify'
  'python-textual'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-setuptools'
  'python-wheel'

)
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
