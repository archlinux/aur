# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime “pep” Buquet <archlinux@bouah.net>

pkgname="python-slixmpp-omemo-git"
pkgver=r40.fb3f714
pkgrel=1
pkgdesc="Slixmpp OMEMO plugin"
arch=("any")
url="https://github.com/Syndace/slixmpp-omemo"
license=("AGPL-3.0-only")
depends=(
    "python"
    "python-oldmemo"
    "python-omemo"
    "python-slixmpp"
    "python-twomemo"
    "python-xmlschema"
    "python-typing_extensions"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-asyncio")
provides=("python-slixmpp-omemo")
conflicts=("python-slixmpp-omemo")
source=("${pkgname}::git+https://github.com/Syndace/slixmpp-omemo.git")
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

check() {
    cd "${pkgname}"
    pytest -o addopts=""
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
