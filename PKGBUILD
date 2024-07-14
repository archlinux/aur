# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-questplus
_pkgname=${pkgname#python-}
pkgver=2023.1
pkgrel=1
pkgdesc='This is a simple implementation of the QUEST+ algorithm in Python'
arch=('any')
url="https://github.com/hoechenberger/questplus"
license=('GPL3')
depends=('python'
         'python-json-tricks'
         'python-scipy'
         'python-xarray')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoechenberger/questplus/archive/${pkgver}.tar.gz")
sha256sums=('7f86be68117fe5caf34b03fa3f93e50868c52c51201c25351579644124ea0834')

build() {
    cd "${_pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
}
