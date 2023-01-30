# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xclean
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r66.c50de27
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=183245'
license=('GPL')
depends=('vapoursynth-plugin-rgsf-git'
         'vapoursynth-plugin-removegrain-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-mvtools-git'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-bm3d-git'
         'vapoursynth-plugin-bm3dcuda-git'
         'vapoursynth-plugin-neo_tmedian-git'
         'vapoursynth-plugin-neo_f3kdb-git'
         'vapoursynth-plugin-vsakarin-git'
         'vapoursynth-plugin-nnedi3_resample'
         'vapoursynth-plugin-nnedi3cl-git'
         )
makedepends=('git')
source=("${_plug}::git+https://github.com/mysteryx93/xClean.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 xClean.py "${pkgdir}${_site_packages}/xClean.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/xClean.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/xClean.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
