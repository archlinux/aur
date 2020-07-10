# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpx
pkgname=python-httpx
pkgver=0.13.3
pkgrel=4
pkgdesc="A next generation HTTP client for Python"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python-certifi' 'python-chardet' 'python-hstspreload' 'python-httpcore' 'python-idna' 'python-rfc3986' 'python-sniffio')
optdepends=('python-brotli: for brotli response decompression')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-brotli' 'python-trustme' 'uvicorn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('54cdee16e8253c221c3298817ccf63a4a0d6755a86feea2aa5a2efe9af44eb1eb0a578b21f593fe28fceace17b0a0badb52a66965c35bf456ea57dd3b905ebbe')
b2sums=('d3a56c2386841909668e34eaa78d202f91ad900230b9d1d4254bfa08312312d020e081aea2839dbb57d85fa26ccfc3f093404801c4dd5c47051f3c9fd2746552')

prepare() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    # do not run coverage in unittests!
    sed -i '/^addopts/d' setup.cfg
}

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
