# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvisa-py
pkgver=0.7.0
pkgrel=3
pkgdesc="A pure python backend for PyVISA"
url="https://github.com/pyvisa/pyvisa-py"
arch=('any')
license=('MIT')
depends=('python-pyvisa')
makedepends=('git' 'python-wheel' 'python-setuptools-scm' 'python-pytest')
optdepends=('linux-gpib: gpib instrument support'
            'python-pyserial: interface with serial instruments'
            'python-pyusb: interface with USB instruments'
            'python-gpib-ctypes: interface with GPIB instruments'
            'python-psutil: discover TCPIP devices across multiple interfaces')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd pyvisa-py
  python setup.py build
}

check() {
  cd pyvisa-py
  python -m pytest --pyargs pyvisa_py
}

package() {
  cd pyvisa-py
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}
