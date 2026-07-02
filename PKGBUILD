# Maintainer: Samuel-Zacharie Faure <samuel.faure.dev@gmail.com>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: ebiadsu <ebiadsu@posteo.de>

pkgname=python-ovh
pkgver=1.2.0
pkgrel=2
pkgdesc="Lightweight wrapper around OVH's APIs"
arch=('any')
url="https://github.com/ovh/python-ovh"
license=('BSD')
depends=('python-requests' 'python-requests-oauthlib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('778c5c7769cb87ed1f512802698cf5b2f25e3a9b5426429508d80b7383c4bc1d')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation

    cd docs
    PYTHONPATH="..:${PYTHONPATH}" make man
}

package() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 docs/_build/man/python-ovh.1 "${pkgdir}/usr/share/man/man1/python-ovh.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
