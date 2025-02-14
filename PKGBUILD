# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsjetpack
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.2.1.0.gdb5cc210
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
    'python-pip'
    'python-wheel'
)
optdepends=(
    'vapoursynth-plugin-vszip'
    'vapoursynth-plugin-resize2'
)
provides=("vapoursynth-plugin-${_plug}"
    vapoursynth-plugin-vsaa
    vapoursynth-plugin-vsdeband
    vapoursynth-plugin-vsdehalo
    vapoursynth-plugin-vsdeinterlace
    vapoursynth-plugin-vsdenoise
    vapoursynth-plugin-vsexprtools
    vapoursynth-plugin-vskernels
    vapoursynth-plugin-vsmasktools
    vapoursynth-plugin-vsrgtools
    vapoursynth-plugin-vsscale
    vapoursynth-plugin-vssource
    vapoursynth-plugin-vstools
    vapoursynth-plugin-vsaa-git
    vapoursynth-plugin-vsdeband-git
    vapoursynth-plugin-vsdehalo-git
    vapoursynth-plugin-vsdeinterlace-git
    vapoursynth-plugin-vsdenoise-git
    vapoursynth-plugin-vsexprtools-git
    vapoursynth-plugin-vskernels-git
    vapoursynth-plugin-vsmasktools-git
    vapoursynth-plugin-vsrgtools-git
    vapoursynth-plugin-vsscale-git
    vapoursynth-plugin-vssource-git
    vapoursynth-plugin-vstools-git
)
conflicts=(
    "vapoursynth-plugin-${_plug}"
    vapoursynth-plugin-vsaa
    vapoursynth-plugin-vsdeband
    vapoursynth-plugin-vsdehalo
    vapoursynth-plugin-vsdeinterlace
    vapoursynth-plugin-vsdenoise
    vapoursynth-plugin-vsexprtools
    vapoursynth-plugin-vskernels
    vapoursynth-plugin-vsmasktools
    vapoursynth-plugin-vsrgtools
    vapoursynth-plugin-vsscale
    vapoursynth-plugin-vssource
    vapoursynth-plugin-vstools
    vapoursynth-plugin-vsaa-git
    vapoursynth-plugin-vsdeband-git
    vapoursynth-plugin-vsdehalo-git
    vapoursynth-plugin-vsdeinterlace-git
    vapoursynth-plugin-vsdenoise-git
    vapoursynth-plugin-vsexprtools-git
    vapoursynth-plugin-vskernels-git
    vapoursynth-plugin-vsmasktools-git
    vapoursynth-plugin-vsrgtools-git
    vapoursynth-plugin-vsscale-git
    vapoursynth-plugin-vssource-git
    vapoursynth-plugin-vstools-git
)
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    cd "${_plug}"
    pip wheel --no-deps . -w dist
}

package() {
    cd "${_plug}"
    pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
