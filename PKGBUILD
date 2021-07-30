# Maintainer: Hao Cheng <ch1994@outlook.com>
pkgname='python-sklearn-bayes'
_pkgname='sklearn-bayes'
pkgdesc='Python package for Bayesian Machine Learning with scikit-learn API'
pkgver=r542.619bea4
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/AmazaspShumik/sklearn-bayes'
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn')
makedepends=('git' 'cython' 'python-setuptools')
source=($_pkgname::git+https://github.com/AmazaspShumik/sklearn-bayes.git)
sha512sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "$srcdir/$_pkgname"
  # regenerate c file
  find . -name "*.pyx" | xargs cython -3
}
build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}
package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}
