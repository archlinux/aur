# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=ssrmint-git
pkgver=r13.fa1f7ab
pkgrel=5
pkgdesc="Ad-hoc pygments style and lexer for LaTeX pretty-printing of SSReflect"
arch=('any')
url="https://github.com/affeldt-aist/ssrmint"
license=('BSD')
depends=('python' 'python-pygments')
makedepends=('git' 'python-setuptools')
optdepends=()
conflicts=()
source=("$pkgname::git+https://github.com/affeldt-aist/ssrmint"
        "license.patch")
sha256sums=('SKIP'
            '6fa40b2b50c0cd2e513b2b9438a6d41e466a6012e7ac6d97f5ec578d44dfef5c')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  patch -p1 < ../license.patch
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm744 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
