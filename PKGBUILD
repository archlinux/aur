# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=python-respx
pkgver=0.20.1
pkgrel=1
pkgdesc='Mock HTTPX with awesome request patterns and response side effects'
arch=('any')
url='https://github.com/lundberg/respx'
license=('BSD')
depends=('python-httpx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-starlette' 'python-trio' 'python-flask')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('06c34f1d3e252ac6c37b391a5b3d620a972edb87bb27f59fe88c8350f3545ad02795da629e4b1fe801a18025e42836cd437f939fbe8a2034f9c80896e460777e')

build() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py build
}

check() {
    cd "${srcdir}/respx-${pkgver}"

    /usr/bin/pytest -c /dev/null --asyncio-mode=auto -v
}

package() {
    cd "${srcdir}/respx-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
