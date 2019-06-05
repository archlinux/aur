# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=('python-symengine')
_module='symengine.py'
pkgver='0.4.0'
pkgrel=1
pkgdesc="SymEngine is a fast symbolic manipulation library"
url="https://github.com/symengine/symengine.py"
depends=('python' 'symengine=0.4.0')
makedepends=('python-setuptools' 'cython')
license=('MIT')
arch=('any')
source=("https://github.com/symengine/symengine.py/archive/v${pkgver}.tar.gz")
sha256sums=('b9e9884649a3563e24d4b90143e50c9a3ccd6518ea4bf7d7ed819aafc2ce24a2')

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
