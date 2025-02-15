# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_tool=audiocutter
pkgname=vapoursynth-tools-${_tool}-git
pkgver=r26.c518e30
pkgrel=1
pkgdesc="Tools for Vapoursynth: ${_tool} (GIT version)"
arch=('any')
url='https://github.com/AzraelNewtype/audiocutter'
license=('GPL')
depends=(
  'vapoursynth'
  'mkvtoolnix-cli'
)
makedepends=('git')
optdepends=('mkvtoolnix-gui: Graphical interface for Mkvtoolnix')
provides=("vapoursynth-tools-${_tool}")
conflicts=("vapoursynth-tools-${_tool}")
source=("${_tool}::git+https://github.com/AzraelNewtype/audiocutter.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_tool}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_tool}"
  install -Dm644 audiocutter.py "${pkgdir}${_site_packages}/${_tool}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_tool}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_tool}.py"

  install -Dm644 example.vpy "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_tool}/example.vpy"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_tool}/README.md"
}
