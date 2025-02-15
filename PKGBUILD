# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=33.176.gd8c2cca
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=(
  'vapoursynth-plugin-adjust-git'
  'vapoursynth-plugin-mvsfunc-git'
  'vapoursynth-plugin-nnedi3_resample-git'
  'vapoursynth-plugin-vsjetpack-git'
)
optdepends=(
  'vapoursynth-plugin-addgrain-git'
  'vapoursynth-plugin-awarpsharp2-git'
  'vapoursynth-plugin-bm3d-git'
  'vapoursynth-plugin-bwdif-git'
  'vapoursynth-plugin-cas-git'
  'vapoursynth-plugin-ctmf-git'
  'vapoursynth-plugin-dctfilter-git'
  'vapoursynth-plugin-deblock'
  'vapoursynth-plugin-dfttest-git'
  'vapoursynth-plugin-eedi2-git'
  'vapoursynth-plugin-eedi3m-git'
  'vapoursynth-plugin-fft3dfilter-git'
  'vapoursynth-plugin-fluxsmooth'
  'vapoursynth-plugin-hqdn3d-git'
  'vapoursynth-plugin-knlmeanscl-git'
  'vapoursynth-plugin-misc-git'
  'vapoursynth-plugin-mvtools'
  'vapoursynth-plugin-neo_f3kdb-git'
  'vapoursynth-plugin-nnedi3cl-git'
  'vapoursynth-plugin-removegrain-git'
  'vapoursynth-plugin-sangnom-git'
  'vapoursynth-plugin-svpflow1'
  'vapoursynth-plugin-svpflow2-bin'
  'vapoursynth-plugin-ttempsmooth-git'
  'vapoursynth-plugin-znedi3-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'python-hatchling'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=('git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
