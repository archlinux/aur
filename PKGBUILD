# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-front-matters
pkgname="${_pkgname}-git"
pkgver=v2.0.0.r2.ee81761
pkgrel=2
pkgdesc="mdformat plugin to format YAML, TOML, or JSON front matter"
arch=(any)
url="https://github.com/KyleKing/mdformat-front-matters"
license=('MIT')
depends=(
    mdformat
    python-toml
    python-ruamel-yaml
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

