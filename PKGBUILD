# Maintainer: Murat <dev at yamahi dot eu>

pkgname="swayrst-git"
_pkgname="swayrst"
pkgdesc="Restore workspaces in sway to displays and move applications to saved workspaces"
pkgver=1.1
pkgrel=1
arch=(any)
url="https://github.com/Nama/swayrst"
license=(MIT)
depends=("python-sh" "i3ipc-python")
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-wheel"
    )
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Nama/swayrst.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's|-|+|g'
}

build() {
	git -C "${srcdir}/${_pkgname}" clean -dfx
    cd "${srcdir}/${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
