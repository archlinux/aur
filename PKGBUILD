# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asyauth
_pkgname=asyauth
pkgver=0.0.14
pkgrel=1
pkgdesc="Unified authentication library, written in python"
url="https://github.com/skelsec/asyauth"
arch=('any')
license=('MIT')

depends=( 'python>=3.7' 'python-unicrypto>=0.0.10' 'python-asn1crypto>=1.3.0'
'python-asysocks' 'python-minikerberos' 'python-winacl')

makedepends=('python-build' 'python-installer' 'python-wheel'
'python-setuptools>=61.0.0')

source=("https://github.com/skelsec/asyauth/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f9911a039cf17b481ae7e7c559fae8f3c8d8c1b7158c85359014e2d7d2546a30')

build() {
    cd "${_pkgname}-${pkgver}"
    rm -rf tests # conflicts with other packages
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
