# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=pybind11
pkgver=2.2.1
pkgrel=1
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')
checkdepends=('cmake' 'python-pytest' 'python-numpy')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('f8bd1509578b2a1e7407d52e6ee8afe64268909a1bbda620ca407318598927e7')

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
