# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.4.0
pkgrel=2
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks' 'python-oscrypto')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b81dc9f43459db71dfdf5124014cb135357b16d82dd328e110e8a2bfe01fb7ec')

build() {
    cd "${_pkgname}-${pkgver}"
    rm -rf tests # remove tests before build, or they conflict with other packages
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #find "${pkgdir}/usr/lib/" -type d -name tests -exec rm -rf {} +
}
