# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-git
_origpkgname=vsview
pkgver=0.1.0b1.7.gaa95a3b
pkgrel=3
pkgdesc='The next-generation VapourSynth previewer (GIT version)'
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
