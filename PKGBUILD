# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=pybind11
pkgver=2.0.1
pkgrel=4
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')
checkdepends=('cmake' 'python-pytest' 'python-numpy')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('d18383097455cab02e9ff312eaf472e36ae26c3ff46e250b790ddc5ec336fa5c')

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py check
    mkdir build
    cd build
    cmake ..
    make check
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install_headers --install-dir "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
