# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pybind11'
pkgname="${_pkgname}"
pkgver=2.0.1
pkgrel=1
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code.'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')
checkdepends=('cmake' 'python-pytest' 'python-numpy')

source=("https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('d18383097455cab02e9ff312eaf472e36ae26c3ff46e250b790ddc5ec336fa5c')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
  mkdir build
  cd build
  cmake ..
  make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install_headers --install-dir "${pkgdir}/usr/include/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
