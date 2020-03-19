# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=audiocutter
pkgname=vapoursynth-tools-${_plug}-git
pkgver=r26.c518e30
pkgrel=1
pkgdesc="Tools for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/AzraelNewtype/${_plug}"
license=('GPL')
depends=('vapoursynth'
         'mkvtoolnix-cli'
         )
makedepends=('git')
optdepends=('mkvtoolnix-gui: Graphical interface for Mkvtoolnix')
provides=("vapoursynth-tools-${_plug}")
conflicts=("vapoursynth-tools-${_plug}")
source=("${_plug}::git+https://github.com/AzraelNewtype/${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 audiocutter.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 example.vpy "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/example.vpy"
}
