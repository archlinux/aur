# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=33.119.ge20aa02
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-znedi3-git'
         'vapoursynth-plugin-eedi3m-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-sangnom-git'
         'vapoursynth-plugin-misc-git'
         'vapoursynth-plugin-deblock'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-ttempsmooth-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-addgrain-git'
         'vapoursynth-plugin-dctfilter-git'
         'vapoursynth-plugin-hqdn3d-git'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-temporalsoften2-git'
         'vapoursynth-plugin-cas-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-f3kdb-git'
         'vapoursynth-plugin-vsutil-git'
         'vapoursynth-plugin-removegrain-git'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
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
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
