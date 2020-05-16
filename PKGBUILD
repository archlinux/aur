# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsfilterscript
pkgname=vapoursynth-lib-${_plug}-git
pkgver=r89.ee5e08b
pkgrel=1
pkgdesc="Library for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=181027'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-lib-${_plug}")
conflicts=("vapoursynth-lib-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vsFilterScript.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}/Include"
  for i in *.hxx; do install -Dm644 "${i}" "${pkgdir}/usr/include/vsfilterscript/${i}"; done
  cd ..
  for i in Examples/*; do install -Dm644 "${i}" "${pkgdir}/usr/share/vapoursynth/libs/vsfilterscript/${i}"; done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
