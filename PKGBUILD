# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="poezio-omemo-git"
pkgver=r81.758499b
pkgrel=1
pkgdesc="OMEMO plugin for poezio"
arch=("any")
url="https://codeberg.org/poezio/poezio-omemo"
license=("GPL-3.0-only")
depends=(
    "poezio"
    "python"
    "python-oldmemo"
    "python-omemo"
    "python-slixmpp"
    "python-slixmpp-omemo"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
provides=("poezio-omemo")
conflicts=("poezio-omemo")
source=("${pkgname}::git+https://codeberg.org/poezio/poezio-omemo.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
