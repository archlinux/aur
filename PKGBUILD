# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvisa-py
pkgver=0.7.2
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
url="https://github.com/pyvisa/pyvisa-py"
license=('MIT')
arch=('any')
depends=('python-pyvisa')
optdepends=('linux-gpib: gpib instrument support'
            'python-gpib-ctypes: interface with GPIB instruments'
            'python-psutil: discover TCPIP devices across multiple interfaces'
            'python-pyserial: interface with serial instruments'
            'python-pyusb: interface with USB instruments')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd pyvisa-py
  python -m build -w --no-isolation
}

package() {
  cd pyvisa-py
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
