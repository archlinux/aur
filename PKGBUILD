# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname='python2-webencodings'
_name="${pkgname#python2-}"
pkgver=0.5.1
pkgrel=6
pkgdesc='Python 2 implementation of the WHATWG Encoding standard'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"
        'LICENSE')
sha256sums=('b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923'
            'f23bae6ada76095610a77137fb92aec7342723900211c5826d54b4c57907ca56')

check() {
    cd "${_tarname}/${_name}"
    LC_ALL='C.UTF-8' nosetests2 --verbose --with-id
}

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}"
    install -Dm 644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
