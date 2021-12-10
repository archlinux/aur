# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dfmderainbow
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.0.g22faeb5
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth-plugin-temporalmedian-git'
         'vapoursynth-plugin-temporalsoften2-git'
         'vapoursynth-plugin-fluxsmooth-git'
         'vapoursynth-plugin-msmoosh-git'
         'vapoursynth-plugin-minideen-git'
         )
optdepend=('vapoursynth-plugin-mvtools-git'
           'vapoursynth-plugin-fft3dfilter-git'
           )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
