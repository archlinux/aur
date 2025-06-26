# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-pretty-errors-git
_pkgname=pretty-errors-git
pkgver=r130.f61574e
pkgrel=1
pkgdesc="Prettifies Python exception output to make it legible."
arch=('any')
url="https://github.com/onelivesleft/PrettyErrors/"
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools')
source=("pretty-errors-git::git+https://github.com/onelivesleft/PrettyErrors.git")
provides=('python-pretty-errors')
conflicts=('python-pretty-errors')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
