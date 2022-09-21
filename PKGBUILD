# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=fallingtime
pkgname=${_pkgname}-git
pkgver=r96.9cc480b
pkgrel=3
pkgdesc="Arcade game inspired by Fall Down. SDL 2, PC or OpenDingux."
arch=('any')
url="https://github.com/cxong/FallingTime"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
source=("${_pkgname}::git+https://github.com/cxong/FallingTime.git"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
          '2213caa4bb13f483b61a6ea57ee0f74394080505720d004a476ed10651150fc7'
          'e7c80c605000bedabb5cd0c415539288f2a3cc01246e84364dbdac2742a81414')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake .
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install "${srcdir}/${_pkgname}/falling_time" -Dm755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}/data" "${pkgdir}/opt/${_pkgname}/"
  install "${startdir}/${_pkgname}.sh" -Dm755 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
