# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=plum
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r76.647f53a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=173775'
license=('GPL')
depends=('vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-vcm-git'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-bm3d-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Plum.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 Plum.py "${pkgdir}${_site_packages}/Plum.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Plum.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Plum.py"
}
