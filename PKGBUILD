# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=vsfeel
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.1.17.g0f3858e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/TheFeelTrain/vapoursynth-feel"
license=('MIT')
depends=(
    'vapoursynth>=80'
    'vulkan-icd-loader'
)
makedepends=(
    'git'
    'cmake'
    'shaderc'
    'spirv-tools'
    'python-build'
    'python-cmake'
    'python-hatchling'
    'python-hatch-vcs'
    'python-installer'
    'python-setuptools-scm'
)
optdepends=(
    'vapoursynth-plugin-vsjetpack: vs-jetpack backend integration'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | sed 's/^v//; s/-/./g'
}

build() {
    cd "${_plug}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_plug}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
