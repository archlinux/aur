# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vsmuxtools
_origpkgname=vsmuxtools
pkgver=0.4.4
pkgrel=2
pkgdesc="The extension to muxtools with vapoursynth and encoding stuff"
arch=("x86_64")
url='https://pypi.org/project/vsmuxtools/'
license=("MPL-2.0")
depends=(
    "vapoursynth"
    "vapoursynth-plugin-vsjetpack"
    "vapoursynth-plugin-bestsource"
    "vapoursynth-plugin-lsmashsource"
    "vapoursynth-plugin-scxvid"
    "python-numpy"
    "python-muxtools"
    "python-pyparsebluray"
    "python-wakepy"
    "ffms2"
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
sha256sums=('4f16c11854f0029d18ba1fb2bead2ee0b6815ec039e5d73082f70c34fcb066dc')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
