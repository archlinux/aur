# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=astdr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.0.g9cd2154
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-decross-git'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-hqdn3d-git'
         'vapoursynth-plugin-temporalsoften2-git'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-motionmask-git'
         'vapoursynth-plugin-adjust-git'
         )
optdepends=('vapoursynth-plugin-mvtools'
            'vapoursynth-plugin-ctmf-git'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

package(){
  cd "${_plug}"
  install -Dm644 ASTDR.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
