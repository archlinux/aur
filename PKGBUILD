# Maintainer: Chuck Flowers <t_chuck_flowers@yahoo.com>
pkgname=python-py-slvs
pkgver=1.0.6
pkgrel=2
pkgdesc="Python binding of SOLVESPACE geometry constraint solver"
arch=('x86_64')
url="https://github.com/realthunder/slvs_py"
license=('GPL3')
groups=()
depends=("python" "swig")
makedepends=("python-setuptools" "python-scikit-build" "cmake" "git")
checkdepends=()
optdepends=()
provides=($pkgname)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git#tag=v$pkgver" "git+https://github.com/realthunder/solvespace.git")
noextract=()
sha256sums=("SKIP" "SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.mysubmodule.url "$srcdir/solvespace"
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"

	export CXXFLAGS="$CFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
}

