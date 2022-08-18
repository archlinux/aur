# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=insaneaa
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.91.2.g9a7e646
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Beatrice-Raws/VapourSynth-insaneAA'
license=('MIT')
depends=('vapoursynth-plugin-descale-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-znedi3-git'
         'vapoursynth-plugin-eedi3m-git'
         'vapoursynth-plugin-finedehalo-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Beatrice-Raws/VapourSynth-insaneAA.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 insaneAA.py "${pkgdir}${_site_packages}/insaneAA.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/insaneAA.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/insaneAA.py"


  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
