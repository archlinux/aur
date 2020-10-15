# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

_name=ipyparallel
pkgbase=ipython-${_name}
pkgname=python-${_name}
pkgver=6.3.0
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0a97b276c62db633e9e97a816282bdd166f9df74e28204f0c8fa54b71944cfdc')
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
