# Maintainer: DanManN <dnahimov@gmail.com>
pkgname=python-qiskit-api-git
pkgver=2.0.4.r265.2ab2401
pkgrel=3
pkgdesc="A Python library for the Quantum Experience API."
arch=('any')
url="http://www.qiskit.org"
license=('Apache-2.0')
groups=('QISKit')
depends=('python' 'python-requests-ntlm' 'python-cryptography')
makedepends=('git' 'python-setuptools')
provides=('python-qiskit-api')
conflicts=('python-qiskit-api')
source=("git+https://github.com/QISKit/qiskit-api-py.git")
md5sums=('SKIP')

pkgver() {
  cd qiskit-api-py
  # cat setup.py | grep version | cut -d "'" -f2 || git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "%s.r%s.%s" "$(cat setup.py | grep -i version | cut -d "'" -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd qiskit-api-py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
