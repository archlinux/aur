# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=ssrmint-git
pkgver=r9.26df1b7
pkgrel=1
pkgdesc="Ad-hoc pygments style and lexer for LaTeX pretty-printing of SSReflect"
arch=('any')
url="https://github.com/affeldt-aist/ssrmint"
license=('BSD')
depends=('python' 'python-pygments')
makedepends=('git' 'python-setuptools')
optdepends=()
conflicts=()
source=("$pkgname::git+https://github.com/affeldt-aist/ssrmint")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm744 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
