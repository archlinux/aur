# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-ompython'
_name=OMPython
pkgver='3.5.1'
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
sha512sums=('70687a2ae19f4e26ced37f9b851a9fb3f8b07715688e29b9ffb05a0a92b9826ac9b054bd790b58b796bb6128737478e26c508364f78244d8b636ed8d9c58ede3'
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
