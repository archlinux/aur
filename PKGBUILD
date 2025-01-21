# Maintainer: Dennis Værum <archlinux@varum.dk>

_name=toggl-cli
pkgname="python-togglcli"
pkgver=3.0.2
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
makedepends=(
    python-build
    python-installer
    python-wheel
    twine
)
checkdepends=(
    python-inquirer
    python-notify-py
)
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=("https://github.com/AuHau/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()

sha512sums=('e98f5f2815bf4cf09389ab122bc3ee1cfb82b002ac012efac99028e203d4cb37b61096ce6e80c164af090a1603cd033c9f06376b8a0b57526f8fd975eabc6e73')
#sha512sums=("$(curl --location --show-error --silent "${source[0]}" | sha512sum | tr -d '\n -')")

build() {
    cd "${_name}-${pkgver}"

    # Source: https://docs.openstack.org/pbr/latest/user/packagers.html
    # export PBR_VERSION=1.2.3

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
