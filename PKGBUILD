# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-git
_origpkgname=vsview
pkgver=0.6.0.7.g6d6304c
pkgrel=1
pkgdesc='The next-generation VapourSynth previewer (GIT version)'
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
    'pyside6'
)
makedepends=(
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
provides=('vsview')
conflicts=('vsview')
source=("${_origpkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_origpkgname}"
    git describe --long --tags --match "vsview/*" | sed 's|^vsview/v||;s/-/./g'
}

build() {
    cd "${_origpkgname}"
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${_origpkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_origpkgname/LICENSE"
}
