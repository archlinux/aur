# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=python-respx
pkgver=0.20.2
pkgrel=1
pkgdesc='Mock HTTPX with awesome request patterns and response side effects'
arch=('any')
url='https://github.com/lundberg/respx'
license=('BSD')
depends=('python-httpx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-starlette' 'python-trio' 'python-flask')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('14d434942c87032b81bc1b77a0bcf40b85d873720456d1f2cc678f7f53c0107342ed6312b93b8b246c835c8e6c24494bd977a0ce1415b01d515d457a17ccc854')

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
