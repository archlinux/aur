# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-ompython'
_name=OMPython
pkgver='3.6.0'
pkgrel=2
pkgdesc="OpenModelica-Python API Interface"
url="https://openmodelica.org/"
depends=('openmodelica-omc' 'python' 'python-numpy' 'python-psutil' 'python-pyparsing')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('LicenseRef-OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'https://openmodelica.org/osmc-pl/osmc-pl-1.2.txt')
sha512sums=('f8f6911389caec4bcc273ca3eb6bb1a9ca4e99a105f5f8a28f96d4b54a65c633b989def9af60714f8b34df797d839489f83139ec92ba453397324c370fd98b54'
            '519d380f9bba2165c3c09169d3b6737e8c63341face98ab66e476f7b54d3695195b498098144a63e3fcf35727199738c83a1a273702bd48e3c126199292c4085')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    install -Dm644 ${srcdir}/osmc-pl-1.2.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
