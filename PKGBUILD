# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-vsjetengine-git
_origpkgname=vsjetengine
pkgver=1.0.0.0.g8a05a8e
pkgrel=1
pkgdesc="An engine for vapoursynth previewers, renderers and script analyis tools. (GIT version)"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-jet-engine'
license=("EUPL-1.2")
depends=("vapoursynth")
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
conflicts=(
	"python-${_origpkgname}"
	"vapoursynth-plugin-vsengine-git"
)
provides=("python-${_origpkgname}")
source=("${_origpkgname}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-jet-engine.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_origpkgname}"
    echo "$(git describe --long --tags | tr - . | tr -d R | sed 's|test.||g')"
}

build() {
    cd "${_origpkgname}" || exit
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${_origpkgname}" || exit
    python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}