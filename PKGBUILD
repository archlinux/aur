# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r33.6.g64706f7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth-plugin-addgrain-git'
         'vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-bilateral-git'
         'vapoursynth-plugin-cas-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-dctfilter-git'
         'vapoursynth-plugin-deblock'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-eedi3cl-git'
         'vapoursynth-plugin-f3kdb-git'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-hqdn3d-git'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-sangnom'
         'vapoursynth-plugin-svpflow1'
         'vapoursynth-plugin-svpflow2-bin'
         'vapoursynth-plugin-ttempsmooth-git'
         'vapoursynth-plugin-znedi3-git'
         'vapoursynth-plugin-removegrain-git'
         'vapoursynth-plugin-misc-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=('git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git')
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package() {
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
