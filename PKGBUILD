# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=1.0.0
pkgrel=1
pkgdesc="Fight fake news with cryptography & human nature"
_name=${pkgname#python-}
arch=('any')
url="https://pypi.org/project/aletheia/"
license=('AGPL3')
makedepends=('python-setuptools')
depends=('ffmpeg'
'perl-image-exiftool'
'python'
'python-setuptools'
'python-cryptography'
'python-magic'
'python-requests'
'python-termcolor')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('bff56acf37fe64186537e1dafbe31d4161c883a0b9288ae702358c0038309acc3d611932e40058f0e063d9acfe8a8e974c8fb57e80a40932def0c5aa834c845a')

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
