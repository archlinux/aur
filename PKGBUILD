# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-ompython'
_name=OMPython
pkgver='3.4.0'
pkgrel=1
pkgdesc="OpenModelica-Python API Interface"
url="http://openmodelica.org/"
depends=('python' 'python-future' 'openmodelica-omc')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'https://openmodelica.org/osmc-pl/osmc-pl-1.2.txt')
md5sums=('b02ad9fba4de58bf880f0ffe23e7fa50'
         'f4bdef7120b0c3fcffe34734988e58e0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    install -Dm644 ${srcdir}/osmc-pl-1.2.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
