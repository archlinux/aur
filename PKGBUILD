# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=2.0.0
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
sha512sums=('8bb8fdda67d6a9853e3a3c44fa4fa200437152609c3766177f238ceac06c44c976fe2895f74cde445479c21a824e333689846c2e94a339acadba1123cbca2454')

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
