# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vsmuxtools
_origpkgname=vsmuxtools
pkgver=0.5.0
pkgrel=1
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
sha256sums=('c3fc701b80c337c5f97d373ca112e7b0c41f385180ab27a78347dd4e9103b266')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
