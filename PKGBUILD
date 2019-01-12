# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=2.0.2
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
sha512sums=('56d5e10f0f9ad3d419d9e866987bc782fd547214d6886947cd49d4d1e55bbbb4773f3e51e83cafb98a89ca3bc8ddb8db50985a33ea06142fa3e09030d8cd04d9')

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
