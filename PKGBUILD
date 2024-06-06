# Maintainer: Dennis Værum <archlinux@varum.dk>

_name=toggl-cli
pkgname="python-togglcli"
pkgver=3.0.0
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

sha512sums=('4d135ab214fd2a373ee14679a742b7f04f9ee165dc43faff249b92a38a3e305efcf0a20f44f423a124258e4b232026f68161e815b119bdc4973d466e60c5427e')
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
