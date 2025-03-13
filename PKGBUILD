# Contributor: Auerhuhn
# Maintainer: Strykar <strykar@hotmail.com>

_gitpkgname=RouterOS-api
pkgname="python-${_gitpkgname,,}"
pkgver=0.21.0
pkgrel=1
pkgdesc="Python API to Mikrotik RouterBoard devices"
arch=('any')
url="https://github.com/socialwifi/RouterOS-api"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/socialwifi/RouterOS-api/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6c34aa6716d8deba077f8f63b109baa99298abb99193c9ff6e5c09e59e375f63')

prepare() {
    cd "${_gitpkgname}-${pkgver}"
    sed -i "s/\(find_packages\)()/\1(exclude=['tests'])/" setup.py
}

build() {
    cd "${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitpkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
