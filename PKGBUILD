# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-mkdocs
pkgname="${_pkgname}-git"
pkgver=v5.2.0b2.r0.c4bf8d1
pkgrel=1
pkgdesc="mdformat plugin for MkDocs"
arch=(any)
url="https://github.com/KyleKing/mdformat-mkdocs"
license=('MIT')
depends=(
    mdformat
    python-mdit_py_plugins
)
makedepends=(
    python-build
    python-installer
    python-uv-build
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

