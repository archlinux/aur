# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=ssrmint-git
pkgver=r19.658e636
pkgrel=6
pkgdesc="Ad-hoc pygments style and lexer for LaTeX pretty-printing of SSReflect"
arch=('any')
url="https://github.com/affeldt-aist/ssrmint"
license=('BSD')
depends=('python' 'python-pygments')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
conflicts=()
source=("$pkgname::git+https://github.com/affeldt-aist/ssrmint")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm744 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
