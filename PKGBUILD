# Maintainer: Dennis Værum <archlinux@varum.dk>

_name=toggl-cli
pkgname="python-togglcli"
pkgver=2.4.4
pkgrel=1
pkgdesc="Command line tool and set of Python wrapper classes for interacting with toggl's API"
arch=('any')
url="https://github.com/auhau/toggl-cli"
license=('MIT')
groups=()
depends=(
    python-pendulum
    python-requests
    python-click
    python-inquirer
    python-prettytable
    python-validate-email
    python-click-completion
    python-pbr
    python-notify-py
)
makedepends=(python-build python-installer python-wheel twine)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=("https://github.com/AuHau/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()

sha512sums=('32c28e5f396bb0d084f0ee43f7ca78ac54494b795b23ee41a2d1e7c4c2bf57d794025359620af653ebd35c4f2d02b358d40a4606c41fb9bc2ba76114e2969ce7')
#sha512sums=("$(curl --location --show-error --silent "${source[0]}" | sha512sum | tr -d '\n -')")

build() {
    cd "$_name-$pkgver"

    export PBR_VERSION=1.2.3
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
