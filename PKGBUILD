# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=0.6.3
pkgrel=1
pkgdesc="Fight fake news with cryptography & human nature"
_name=${pkgname#python-}
arch=('any')
url="https://danielquinn.github.io/aletheia"
license=('AGPL3')
makedepends=('python-setuptools')
depends=('ffmpeg'
'python'
'python-setuptools'
'python-pillow'
'python-cryptography'
'python-magic'
'python-requests'
'python-termcolor'
'python-piexif')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4734dfd2a86725a6cac29c56600b7e40b36bc34dbd08ce2727ce9669780ec21e1fe439039396c4c56a1acb2500d134892f3ee11731e27636d367d0a8cc4e1dd3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
