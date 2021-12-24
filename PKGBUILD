# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=3.3.2
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
sha512sums=('abd4ea3f3ae58fdd93286637cf066dac1585baaf0118742d2a0dca9478a86ee00de5df916a11a7f65f252e8c82ef6f3399d3b5d9f21dc8e42b13c95584680fa7')

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
