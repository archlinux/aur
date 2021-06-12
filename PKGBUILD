# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=python-respx
pkgver=0.17.0
pkgrel=2
pkgdesc='Mock HTTPX with awesome request patterns and response side effects'
arch=('any')
url='https://github.com/lundberg/respx'
license=('BSD')
depends=('python-httpx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'mypy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('2f5fd27c81a62cc3da45a1c9a40c95a9e480511567f9613e0ecac8991234f0d9e4e2ecfba0b3e294090d9a0f34c66ceaf32a779856c3106411057946e1adefbc')

build() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py build
}

check() {
    cd "${srcdir}/respx-${pkgver}"

    pytest -v --no-cov
    mypy respx
}

package() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
