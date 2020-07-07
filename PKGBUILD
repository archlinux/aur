# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
pkgver=0.9.1
pkgrel=3
pkgdesc="A minimal HTTP client"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python-h11' 'python-h2' 'python-sniffio')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-trustme' 'mitmproxy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('5105ff0c19b8a4a34080e79aa1d191199131450e658fbe0949b091e5acfb9cd8b11033757a3bd7dd1490e5fb61352eb44d086babd70d22be33479befd16745fd')
b2sums=('8f7416c1e726892b152e7e9623790ac1e70b9142f45028b23df25f1d54b6f113f1a79839ec2a7d90b196197d53c880847526c2e47e07d52a0e104a9e2849bccf')

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
