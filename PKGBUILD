# Maintainer: coloursofnoise <coloursofthenoise at google mail>
pkgname=python-dnfile
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="Python .NET executable parsing module"
url="https://github.com/malwarefrank/dnfile"
arch=('any')
license=('MIT')
depends=('python' 'python-pefile')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('48b9b2ed3b295ab3d9f93639b2418915cee7970cb57ef56f858e3610e1b45ea8')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
