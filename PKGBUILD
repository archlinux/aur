# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-cli
_origpkgname=vsview_cli
pkgver=1.0.0
pkgrel=1
pkgdesc='The next-generation VapourSynth previewer'
arch=('x86_64')
url='https://pypi.org/project/vsview-cli'
license=('Unlicense')
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-setuptools'
    'python-versioningit'
    'python-wheel'
    'python-maturin'
)
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('1f1111fbc1a87dfba395b65053014a3d71a90232df96f279afcec46acd86c901')

package() {
    cd "${_origpkgname}-${pkgver}" || exit
    MATURIN_SKIP_SBOM=1 python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms
}
