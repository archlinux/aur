# Maintainer: pumpkincheshire <sollyonzou at gmail dot com>

pkgname=python-pyeit-git
pkgver=1.0.0.r58.g92c5524
pkgrel=3
_name=pyEIT
pkgdesc="Python based toolkit for Electrical Impedance Tomography"
arch=('any')
url="https://github.com/liubenyuan/pyEIT"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-pandas' 'python-matplotlib')
makedepends=('git' 'python-setuptools')
optdepends=('python-vispy' 'python-xarray')
conflicts=('python-pyeit')
provides=('python-pyeit')

source=("$_name::git+https://github.com/liubenyuan/$_name.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
