pkgname=pypy3-pybind11
_pkgname=pybind11
pkgver=2.9.2
pkgrel=1
pkgdesc='A lightweight header-only library that exposes C++ types in Python and vice versa'
arch=('any')
url='https://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('pypy3: for python bindings')
makedepends=('cmake' 'boost' 'eigen' 'pypy3-setuptools')
source=("https://github.com/pybind/pybind11/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bd528c4dbe2276635dc787b6b1f2e5316cf6b49ee3e150264e455a0d68d19c1')

build () {
    cd "${_pkgname}-${pkgver}"
    pypy3 setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --skip-build --optimize='1'
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
