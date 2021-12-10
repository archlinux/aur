# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xvs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r19.be07d66
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/xyx98/my-vapoursynth-script'
license=('GPL')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-havsfunc'
         'vapoursynth-plugin-muvsfunc-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-muvsfunc-git'
#          'vapoursynth-plugin-vsfilter-git'        # windows only
#          'vapoursynth-plugin-vsfiltermod-git'     # windows only
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-tdeintmod-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-znedi3-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-dpid-git'
         'vapoursynth-plugin-tonemap-git'
         'vapoursynth-plugin-ffms2'
         'vapoursynth-plugin-lsmashsource'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-readmpls-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/xyx98/my-vapoursynth-script.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 xvs.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
