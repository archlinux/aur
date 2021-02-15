# Contributor: Alexandr Parkhomenko <it@52tour.ru>

_author=pavlin-policar
_pkgname=opentsne
pkgname=python-$_pkgname-git
pkgver=0.5.1
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba')
makedepends=('python-setuptools')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags `git rev-list --tags --max-count=1` | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g' #| sed -r "s/0$/$COMMIT/"
}


build() {
  cd "${srcdir}/$_pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}
