# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview
pkgver=0.1.0b1
pkgrel=2
pkgdesc='The next-generation VapourSynth previewer'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=('EUPL-1.2')
depends=(
    'vapoursynth'
    'vapoursynth-plugin-vsjetpack'
    'python-jetpytools'
    'python-vsjetengine'
    'python-vspackrgb'
    'python-pydantic'
    'python-typer'
    'python-pygments'
    'python-pluggy'
    'python-typing_extensions'
    'python-pathvalidate'
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}