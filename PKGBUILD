# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-tables
pkgname="${_pkgname}-git"
pkgver=v0.4.1.r0.c169887
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/executablebooks/mdformat-tables"
license=('MIT')
depends=(mdformat)
makedepends=(
    python-pip
    python-build
    python-wheel
    python-flit
    python-installer
    python-poetry
)
source=("${_pkgname}::git+${url}.git")
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
