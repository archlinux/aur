# Maintainer: DanManN <dnahimov@gmail.com>
pkgname=python-qiskit-sdk-git
pkgver=0.4.8.r484.g23d7ea5
pkgrel=2
pkgdesc="Python software development kit for writing quantum computing experiments, programs, and applications."
arch=('any')
url="http://www.qiskit.org"
license=('Apache-2.0')
groups=('QISKit')
depends=('python' 'python-networkx' 'python-ply' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pillow' 'python-sympy' 'python-qiskit-api')
makedepends=('git' 'cmake' 'python-setuptools' 'python-pylint' 'python-pycodestyle' 'python-sphinx' 'python-sphinxcontrib-fulltoc' 'python-coverage' 'python-better-apidoc' 'python-jsonschema' 'python-wheel')
provides=('python-qiskit-sdk')
conflicts=('python-qiskit-sdk')
source=("git+https://github.com/QISKit/qiskit-terra.git")
md5sums=('SKIP')

pkgver() {
  cd qiskit-terra
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd qiskit-terra
  cmake .
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
