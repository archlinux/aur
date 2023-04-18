# Maintainer: Chuck Flowers <t_chuck_flowers@yahoo.com>
pkgname=python-py-slvs
pkgver=1.0.5
pkgrel=2
epoch=
pkgdesc="a python binding of the 2D/3D geometry constraint solver from a forked version of SOLVESPACE."
arch=('any')
url="https://github.com/realthunder/slvs_py"
license=('unknown')
groups=()
depends=("python" "swig")
makedepends=("python-setuptools" "python-scikit-build" "cmake" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname::git+$url#tag=v$pkgver"
	"git+https://github.com/realthunder/solvespace.git"
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
)
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.mysubmodule.url "$srcdir/solvespace"
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
