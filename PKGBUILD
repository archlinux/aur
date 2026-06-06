# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=python-hibpwned
_name=hibpwned
pkgver=1.3.9
pkgrel=1
pkgdesc='Python API wrapper for haveibeenpwned.com'
arch=('any')
url='https://github.com/plasticuproject/hibpwned'
license=('LGPL-3.0-only')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('60b18d77ee81e47c84e013cd68184b3b420e71dc7a9df371bd7723ae6e8e72a6')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_name}/json" | jq -r .info.version
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    PYTHONPATH=. python -c 'import hibpwned; assert hibpwned.Pwned'
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
