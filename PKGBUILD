# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

_name=ipyparallel
pkgbase=ipython-${_name}
pkgname=python-${_name}
pkgver=7.1.0
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ea756df0d2485bac19cccb0dbf4cafbc855c922b9b5905b4906e6cfac8b3c648')
depends=('ipython' 'python-setuptools' 'python-jupyter_client' 'python-tornado' 'python-decorator')
conflicts=('ipython2-ipyparallel')
replaces=('ipython-ipyparallel')

build() {
  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir/usr/etc" "$pkgdir/etc"
}
