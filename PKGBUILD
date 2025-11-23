# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsjetpack
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.0rc1.10.g21a2c5fd
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack'
license=('MIT')
depends=(
    'vapoursynth'
    'python-rich'
    'python-jetpytools'
    'python-typing_extensions'
    'python-scipy'
    'vapoursynth-plugin-vsakarin'
    'vapoursynth-plugin-resize2'
)
makedepends=('git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-versioningit'
)
optdepends=(
    'ffms2'
    'vapoursynth-plugin-adaptivegrain'
    'vapoursynth-plugin-addnoise'
    'vapoursynth-plugin-awarpsharp2'
    'vapoursynth-plugin-bestsource'
    'vapoursynth-plugin-bilateralgpu'
    'vapoursynth-plugin-bm3d: Denoiser'
    'vapoursynth-plugin-bm3dcuda: Denoiser'
    'vapoursynth-plugin-bwdif'
    'vapoursynth-plugin-chickendream'
    'vapoursynth-plugin-d2vsource'
    'vapoursynth-plugin-dctfilter'
    'vapoursynth-plugin-descale-jet-git'
    'vapoursynth-plugin-dfttest2: Denoiser'
    'vapoursynth-plugin-dpid'
    'vapoursynth-plugin-eedi2'
    'vapoursynth-plugin-eedi3m'
    'vapoursynth-plugin-fft3dfilter: Denoiser'
    'vapoursynth-plugin-fmtconv'
    'vapoursynth-plugin-hysteresis'
    'vapoursynth-plugin-imwri'
    'vapoursynth-plugin-knlmeanscl: NLMeans Denoiser (OpenCL)'
    'vapoursynth-plugin-lsmashsource'
    'vapoursynth-plugin-mlrt'
    'vapoursynth-plugin-mvtools'
    'vapoursynth-plugin-neo_f3kdb: Debanding'
    'vapoursynth-plugin-nlm-cuda: NLMeans Denoiser (CUDA)'
    'vapoursynth-plugin-nlm: NLMeans Denoiser (CPU)'
    'vapoursynth-plugin-placebo'
    'vapoursynth-plugin-removegrain'
    'vapoursynth-plugin-retinex'
    'vapoursynth-plugin-sangnom'
    'vapoursynth-plugin-scxvid: Scene detection'
    'vapoursynth-plugin-tcanny'
    'vapoursynth-plugin-tedgemask'
    'vapoursynth-plugin-vivtc'
    'vapoursynth-plugin-vszip'
    'vapoursynth-plugin-wnnm'
    'vapoursynth-plugin-wwxd: Scene detection'
    'vapoursynth-plugin-znedi3'
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
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${_plug}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
