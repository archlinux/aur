# Maintainer: getzze <getzze at_gmail dot_com>
# Based on python-tslearn PKGBUILD
pkgname=python-tslearn-git
pkgver=r837.1721482
pkgrel=1
pkgdesc="A machine learning toolkit dedicated to time-series data. Version from the latest commit."
arch=('x86_64')
url='https://github.com/rtavenar/tslearn'
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'cython' 'python-scikit-learn')
optdepends=('python-tensorflow' 'python-keras-applications' 'python-keras-preprocessing')
makedepends=('git' 'python-setuptools' 'cython>=0.17')
provides=('python-tslearn')
conflicts=('python-tslearn')
options=(!emptydirs)
source=("git://github.com/rtavenar/tslearn.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/tslearn"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/tslearn"
  python setup.py build
}

package() {
  cd "$srcdir/tslearn"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

