# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview
pkgver=0.12.1
pkgrel=2
pkgdesc='The next-generation VapourSynth previewer'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=('EUPL-1.2')
depends=(
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
    'python-cyclopts>=5.1.0'
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
)
source=(
    "${pkgname}::git+${url}.git#tag=vsview/v${pkgver}"
    "${pkgname}.desktop"
)
sha256sums=('2374692b263b7fa8b5cb2605b0b4411feb1684b13007cb091cb91564a9f0a35b'
            '20a08e239e1ccd181023f5fa51b2bc98f415b194c86a352777bd441197188755')

build() {
    cd "${pkgname}"
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "src/vsview/assets/icon@4x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
