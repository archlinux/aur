# Maintainer: Joël Porquet-Lupine <joel@porquet.org>

_pkgname='openconnect-pulse-gui'
pkgname="${_pkgname}-git"
pkgver=r23.47edbd8
pkgrel=1
pkgdesc="Allows openconnect web-based authentication for Pulse Secure Connect appliances"
url="https://github.com/utknoxville/openconnect-pulse-gui"
arch=('any')
license=('GPL3')
depends=('bash' 'python-gobject' 'webkit2gtk' 'openconnect')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)

source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
