# Maintainer: Yamashita Ren
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-light-git
pkgver=r32.3.g14b27b5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (Optional Depends, GIT Version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-mvsfunc-git'
         )
optdepends=('vapoursynth'
            'vapoursynth-plugin-addgrain-git'
            'vapoursynth-plugin-awarpsharp2-git'
            'vapoursynth-plugin-bilateral-git'
            'vapoursynth-plugin-ctmf-git'
            'vapoursynth-plugin-dctfilter-git'
            'vapoursynth-plugin-deblock-git'
            'vapoursynth-plugin-dfttest-git'
            'vapoursynth-plugin-eedi2-git'
            'vapoursynth-plugin-eedi3cl-git'
            'vapoursynth-plugin-f3kdb-git'
            'vapoursynth-plugin-fluxsmooth'
            'vapoursynth-plugin-fft3dfilter-git'
            'vapoursynth-plugin-fmtconv-git'
            'vapoursynth-plugin-hqdn3d-git'
            'vapoursynth-plugin-knlmeanscl'
            'vapoursynth-plugin-mvtools-git'
            'vapoursynth-plugin-nnedi3_resample-git'
            'vapoursynth-plugin-nnedi3-git'
            'vapoursynth-plugin-nnedi3cl-git'
            'vapoursynth-plugin-sangnom'
            'vapoursynth-plugin-svpflow1'
            'vapoursynth-plugin-svpflow2-bin'
            'vapoursynth-plugin-znedi3-git'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}" "vapoursynth-plugin-${_plug}-git")
source=("git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git")
sha1sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
