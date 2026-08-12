# Maintainer: TheFeelTrain <the@feeltra.in>

_plugin=histogram
pkgname=vsview-${_plugin}
pkgver=0.3.0
pkgrel=1
pkgdesc="A vsview plugin displaying video clips' histograms and other related visualizations"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-vsjetpack"
    "python-numpy"
    "python-numba"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-hatchling"
    "python-versioningit"
    "python-hatch-sbom"
)
source=("${pkgname}::git+${url}.git#tag=${_plugin}/v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${pkgname}/src/plugins/${_plugin}" || exit
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
