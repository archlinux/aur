# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vsmuxtools
_origpkgname=vsmuxtools
pkgver=0.4.3
pkgrel=1
pkgdesc="The extension to muxtools with vapoursynth and encoding stuff"
arch=("x86_64")
url='https://pypi.org/project/vsmuxtools/'
license=("MPL-2.0")
depends=(
	"vapoursynth"
	"vapoursynth-plugin-vsjetpack"
	"python-numpy"
	"python-muxtools"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
provides=(
	"vapoursynth-plugin-${_origpkgname}"
	"python-vsmuxtools"
)
conflicts=("vapoursynth-plugin-${_origpkgname}")
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('505042f5501c3b1424bceb7d92298700ce13cb0cf6d94b4b0752b2a444402780')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
