# Maintainer: TheFeelTrain <the@feeltra.in>

_plugin=fftspectrum
pkgname=vsview-${_plugin}
pkgver=0.1.3
pkgrel=2
pkgdesc="A vsview plugin displaying the Fast Fourier transform spectrum of a video clip"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("EUPL-1.2")
depends=(
    "vsview"
    "vapoursynth-plugin-fftspectrum-rs"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-hatchling"
    "python-versioningit"
)
source=("${pkgname}::git+${url}.git#tag=${_plugin}/v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${pkgname}/src/plugins/${_plugin}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}