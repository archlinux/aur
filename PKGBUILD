# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_name=swyft
pkgname=python-$_name-git
pkgver=r1231.7fc474f
pkgrel=1
pkgdesc="swyft is the official implementation of Truncated Marginal Neural Ratio Estimation (TMNRE), a hyper-efficient, simulation-based inference technique for complex data and expensive simulators."
arch=(any)
url="https://github.com/undark-lab/swyft"
license=('Apache')
groups=()
depends=(python-toolz python-numpy python-pytorch python-pytorch-lightning python-zarr python-matplotlib python-scipy python-torchist python-fasteners)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git#branch=dev")
noextract=()
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
