# Maintainer: Yakov Till <yakov.till@gmail.com>

_name=packaging
pkgname=python312-packaging
pkgver=26.2
pkgrel=1
pkgdesc="Core utilities for Python packages for Python 3.12"
arch=('any')
url="https://packaging.pypa.io/"
license=('Apache-2.0' 'BSD-2-Clause')
depends=('python312')
makedepends=('python-build' 'python-flit-core')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_name}/json" | jq -r '.info.version'
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"

    install -d "${pkgdir}/usr/lib/python3.12/site-packages"
    bsdtar -xf "dist/${_name}-${pkgver}-py3-none-any.whl" -C "${pkgdir}/usr/lib/python3.12/site-packages"

    install -Dm644 LICENSE.APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.APACHE"
    install -Dm644 LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
