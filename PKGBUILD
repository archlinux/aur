# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=3.2.0
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
'python-dnspython'
'python-magic'
'python-requests'
'python-termcolor')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8b39832126ca0d00ae1e37925b6366efc37d28e4ae81759eb275e82480cd201a57a8acd7858178d0ac946bc4c4627ef7feb543b4a8f460bb45830e0980a8205b')

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
