# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-arch')
_module='arch'
pkgver='4.1'
pkgrel=1
pkgdesc="ARCH models in Python."
url="https://pypi.python.org/pypi/arch/4.1"
depends=('python'
    'python-numpy'
    'python-pandas'
    'python-scipy'
    'python-statsmodels')
checkdepends=('python-pytest')
makedepends=('cython' 'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
source=("https://github.com/bashtage/arch/archive/${pkgver}.tar.gz")
sha256sums=('1f3348e0eda8705671ff4041be90af230aa0a28939a5d7f3b9a2ca93cdb7c736')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    py.test
}
