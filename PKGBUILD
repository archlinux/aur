# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=hstspreload
pkgname=python-hstspreload
pkgver=2021.11.1
pkgrel=2
pkgdesc="Chromium HSTS Preload list as a Python package"
arch=('any')
url="https://github.com/sethmlarson/${_pkgname}"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-urllib3')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a5d42098c07c4b472916c4a695bafd3db6bc3144aabb43f933d2d56fa97cbfa4899d326e27eb4786658a91761fcc82fe0d68a61f4ce344365e209bbcdfe456f4')
b2sums=('1818718bace7cd107a378043496e11b5110d25e4fe723e0b242cd6dd484477d9160d16420d44edc41b93a61f9e29c5705f0946d2c3efef95525cb0518ef11ff3')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

# This runs around 230k tests, checking to see if the online list matches the current one.
# It can take 5 minutes just to collect the tests. They're not distributed in the PyPI tarball.
#check() {
#    cd "${srcdir}"/${_pkgname}-${pkgver}
#
#    python -m pytest
#}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
