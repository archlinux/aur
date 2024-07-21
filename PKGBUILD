# Maintainer: Tilman BLUMENBACH <tilman+aur@ax86.net>

pkgname=pacmimi
pkgver=1.1.2
pkgrel=1
pkgdesc="Arch Linux Pacman mirrorlist merging utility"
arch=(any)
url="https://pypi.org/project/pacmimi/"
license=('BSD-3-Clause')
depends=(python)
makedepends=(
    git
    python-build python-installer python-wheel
)
source=(
    "${pkgname?}::git+https://github.com/Tblue/pacmimi?signed#tag=v${pkgver?}"
)
sha256sums=('SKIP')

# See:
# https://github.com/Tblue/pacmimi/blob/master/README.rst#gpg-signed-git-release-tags
validpgpkeys=('B67BD719C23DC2A403E15EB102DE477F6DDE8B17')

prepare() {
    cd "${pkgname?}"

    git clean -fxd
}

build() {
    cd "${pkgname?}"

    python -m build --wheel
}

package() {
    cd "${pkgname?}"

    python -m installer --destdir="${pkgdir?}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir?}/usr/share/licenses/${pkgname?}"
}

# vim: tw=79
