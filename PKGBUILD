# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=('python-symengine')
_module='symengine.py'
pkgver='0.5.1'
pkgrel=1
pkgdesc="SymEngine is a fast symbolic manipulation library"
url="https://github.com/symengine/symengine.py"
depends=('python' 'symengine>=0.5.0')
makedepends=('python-setuptools' 'cython')
license=('MIT')
arch=('any')
source=("https://github.com/symengine/symengine.py/archive/v${pkgver}.tar.gz")
sha256sums=('88cd9426835a7f58d3f9e901408f2c09f3e34d6ab384500089efbe3dd84b1c2a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    CMAKE_INSTALL_PREFIX="${pkgdir}" python setup.py build
}

# check() causes some issues when packaging...
# check() {
# 	cd "${srcdir}/${_module}-${pkgver}"
# 	CMAKE_INSTALL_PREFIX="${pkgdir}" python setup.py test
# }


package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    CMAKE_INSTALL_PREFIX="${pkgdir}" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
