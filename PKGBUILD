# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asyauth
_pkgname=asyauth
pkgver=0.0.26
pkgrel=1
pkgdesc="Unified authentication library, written in python"
url="https://github.com/skelsec/asyauth"
arch=('any')
license=('MIT')

depends=( 'python>=3.7' 'python-unicrypto>=0.0.12' 'python-asn1crypto>=1.3.0'
'python-asysocks>=0.2.19' 'python-minikerberos>=0.4.13' 'python-winacl')

makedepends=('python-build' 'python-installer' 'python-wheel'
'python-setuptools>=61.0.0')

source=("https://github.com/skelsec/asyauth/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3c13376c011c534532e1ec3808874773eda9feb944d97af5a673f9c0562313b5')

build() {
    cd "${_pkgname}-${pkgver}"
    rm -rf tests # conflicts with other packages
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
