# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r33.20.gae1d799
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
         'vapoursynth-plugin-fmtconv-git'
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
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=('git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git')
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

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
