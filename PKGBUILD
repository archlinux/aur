# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-hatch-cython-varde-git
_origpkgname=hatch_cython
pkgver=r189.b4199ba
pkgrel=1
pkgdesc="Vardë fork of hatch-cython (GIT version)"
arch=("x86_64")
url='https://github.com/Varde-s-Forks/hatch-cython'
license=("MIT")
provides=("python-hatch-cython")
conflicts=("python-hatch-cython")
depends=(
	"cython"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)

source=("${_origpkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_origpkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_origpkgname}" || exit
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${_origpkgname}" || exit
    python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
