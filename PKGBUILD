# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsfilterscript
pkgname=vapoursynth-lib-${_plug}-git
pkgver=r37.98c5c11
pkgrel=2
pkgdesc="Library for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=181027'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-lib-${_plug}")
conflicts=("vapoursynth-lib-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vsFilterScript.git#branch=GCC9")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"

  for i in *.h* *.cxx; do install -Dm644 "${i}" "${pkgdir}/usr/include/vsfilterscript/${i}"; done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
