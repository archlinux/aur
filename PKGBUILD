# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-admon
pkgname="${_pkgname}-git"
pkgver=v1.0.2.r1.282ca53
pkgrel=1
pkgdesc="An mdformat plugin for admonitions."
arch=(any)
url="https://github.com/KyleKing/mdformat-admon"
license=('MIT')
depends=(mdformat python-mdit_py_plugins)
makedepends=(
    python-pip
    python-build
    python-wheel
    python-flit
    python-installer
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
