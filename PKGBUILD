# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname='python2-markupsafe'
_name='MarkupSafe'
pkgver=1.1.1
pkgrel=10
pkgdesc='Safely add untrusted strings to HTML/XML markup'
arch=('x86_64')
url="https://pypi.python.org/pypi/${_name}/${pkgver}"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('184ab0bc42f8d254ef4239f700f019c0a380bdf2117dfe1abe2eb4dfa0f037158d181a120d8654a6971e9c8badb078f997e3a8bf231898e0f4bb3e8496d9abd3')

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    cd "${_tarname}"
    python2 setup.py pytest
}

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm 644 'LICENSE.rst'  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
