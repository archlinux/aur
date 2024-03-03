# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-ompython'
_name=OMPython
pkgver='3.5.0'
pkgrel=1
pkgdesc="OpenModelica-Python API Interface"
url="https://openmodelica.org/"
depends=('openmodelica-omc' 'python' 'python-future' 'python-numpy' 'python-psutil' 'python-pyparsing')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('LicenseRef-OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'https://openmodelica.org/osmc-pl/osmc-pl-1.2.txt')
md5sums=('a4d0d9a5f27b6456ad79fdadea629cad'
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
