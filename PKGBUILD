# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=python-respx
pkgver=0.21.0
pkgrel=1
pkgdesc='Mock HTTPX with awesome request patterns and response side effects'
arch=('any')
url='https://github.com/lundberg/respx'
license=('BSD')
depends=('python-httpx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-starlette' 'python-trio' 'python-flask')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a5a7a14536d19aea42bd33ea9cde3f2a989db3be29a30f40966c339d45c1e490d72ab40bcc60d85fe3f675c4eb30db4692e85f64898e77cc74e483744086f4b8')

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
