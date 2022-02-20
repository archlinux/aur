# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=python-respx
pkgver=0.19.2
pkgrel=1
pkgdesc='Mock HTTPX with awesome request patterns and response side effects'
arch=('any')
url='https://github.com/lundberg/respx'
license=('BSD')
depends=('python-httpx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-starlette' 'python-trio' 'python-flask')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('99e1da094f1b4446a837fda4edfb8c0201c582d55865987c6d5301f0779057923012c7d5157d7762be4603b98ce77ed0261b9614f199ca40ad4ecf4d61b04228')

build() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py build
}

check() {
    cd "${srcdir}/respx-${pkgver}"

    pytest -c /dev/null -v
}

package() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
