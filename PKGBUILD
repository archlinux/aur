# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview
pkgver=0.10.0
pkgrel=1
pkgdesc='The next-generation VapourSynth previewer'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=('EUPL-1.2')
depends=(
    'vsview-cli'
    'vapoursynth'
    'python-jetpytools'
    'python-vsjetengine'
    'python-vspackrgb'
    'python-pydantic'
    'python-typer'
    'python-pygments'
    'python-pluggy'
    'python-typing_extensions'
    'python-keyring'
    'python-dotenv'
    'pyside6'
)
makedepends=(
    'git'
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-setuptools'
    'python-versioningit'
    'python-wheel'
    'python-hatch-sbom'
)
optdepends=(
    'vapoursynth-plugin-bestsource: Source filter'
    'vsview-comp: Make comparisons with Slowpoke Pics'
    'vsview-fftspectrum: Display the FFT spectrum of a video clip'
    'vsview-frameprops-extended: Add more categories and formats to frameprops'
    "vsview-split-planes: Display video clips' constituent planes"
    'vsview-audio-convert: Convert and resample audio'
    'vsview-nativeres: Analyze and determine native resolution'
    'vsview-plugins-all: Meta package for all plugins'
    'vsview-plugins-essential: Meta package for essential plugins'
)
source=("${pkgname}::git+${url}.git#tag=vsview/v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
