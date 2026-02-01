# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvisa-py
pkgver=0.8.1
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
url="https://github.com/pyvisa/pyvisa-py"
license=('MIT')
arch=('any')
depends=('python-pyvisa' 'python-psutil' 'python-pytest' 'python-pyusb')
optdepends=('linux-gpib: gpib instrument support'
            'python-gpib-ctypes: interface with GPIB instruments'
            'python-psutil: discover TCPIP devices across multiple interfaces'
            'python-pyserial: interface with serial instruments'
            'python-pyusb: interface with USB instruments')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('58d2a0cbaad2d024822b857eee843b8ed76239bc2fccaf8631bc5ab20732091d')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd pyvisa-py-$pkgver
  python -m build -w --no-isolation
}

package() {
  cd pyvisa-py-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
