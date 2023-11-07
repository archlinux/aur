# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: ebiadsu <ebiadsu@posteo.de>

pkgname=python-ovh
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight wrapper around OVH's APIs"
arch=('any')
url="https://github.com/ovh/python-ovh"
license=('BSD')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dae0e216bd62c37199f1398219056e399c28ed27f3aa5589b87eb38351ecdde9')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

    cd docs
    make man
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 docs/_build/man/python-ovh.1 "${pkgdir}/usr/share/man/man1/python-ovh.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
