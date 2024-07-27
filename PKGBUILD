# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-pretty-errors-git
pkgver=1.891da7e
pkgrel=1
pkgdesc="Prettifies Python exception output to make it legible."
arch=('any')
url="https://github.com/onelivesleft/PrettyErrors/"
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer')
source=("pretty-errors-git::git+https://github.com/onelivesleft/PrettyErrors.git")
provides=('python-pretty-errors')
conflicts=('python-pretty-errors')
md5sums=('SKIP')

pkgver() {
  mkdir python-pretty-errors-git
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pretty-errors-git"
python -m build
}

package() {
  cd "$srcdir/pretty-errors-git"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}

