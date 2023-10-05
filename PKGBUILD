# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-gfm
pkgname="${_pkgname}-git"
pkgver=0.3.5.r4.735781e
pkgrel=1
pkgdesc="Mdformat plugin for GitHub-Flavored Markdown compatibility"
arch=(any)
url="https://github.com/hukkin/mdformat-gfm"
license=('MIT')
depends=(
    mdformat
    mdformat-tables
    python-linkify-it-py
    python-markdown-it-py
    python-mdit_py_plugins
)
makedepends=(
    python-pip
    python-build
    python-wheel
    python-flit
    python-installer
)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
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
