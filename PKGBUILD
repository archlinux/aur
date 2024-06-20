# Maintainer: Dennis Værum <archlinux@varum.dk>

_name=toggl-cli
pkgname="python-togglcli"
pkgver=3.0.1
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

sha512sums=('e2d4ca6ee8cf5d1b8489ae1e1dfd21812313823a8d13b29f8a92462c43b163879e39b32f9176ba090e2a6a69eae9013d8fc8448eef3c15b8edc81a374ab2e354')
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
