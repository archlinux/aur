# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=astdr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.0.gf55e270
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-decross-git'
         'vapoursynth-plugin-fluxsmooth-git'
         'vapoursynth-plugin-hqdn3d-git'
         'vapoursynth-plugin-temporalsoften2-git'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-motionmask-git'
         'vapoursynth-plugin-adjust-git'
         )
optdepends=('vapoursynth-plugin-mvtools-git'
            'vapoursynth-plugin-ctmf-git'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  install -Dm644 "${_plug}/ASTDR.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}