# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

_name=ipyparallel
pkgbase=ipython-${_name}
pkgname=python-${_name}
pkgver=8.0.0
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'jupyterlab' 'python-packaging' 'npm')
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('95305a886f2c42e9603c034ea684e5c031d9d4222c66ed6d85eb3ae15d631e4b')
depends=(
  'ipython'
  'python-dateutil'
  'python-decorator'
  'python-entrypoints'
  'python-ipykernel'
  'python-jupyter_client'
  'python-psutil'
  'python-pyzmq'
  'python-setuptools'
  'python-tornado'
  'python-tqdm'
  'python-traitlets'
)
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
