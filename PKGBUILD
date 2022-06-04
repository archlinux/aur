# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgbase=WolkenWelten
_pkgname=${_pkgbase,,}
pkgname=${_pkgname}-git
pkgver=r2018.3488672d
pkgrel=2
pkgdesc='Gamemix between Minecraft, Quake ]I[ and Emacs in C99'
arch=('i686' 'x86_64' 'aarch64')
url="https://wolkenwelten.net/"
license=('GNU')
depends=('ffmpeg' 'sdl2' 'sdl2_mixer')
makedepends=('clang' 'git' 'nasm')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(${_pkgname}::"git+https://git.sr.ht/~melchizedek6809/${_pkgbase}")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  git submodule update --init --recursive
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-server" "${pkgdir}/usr/bin/${_pkgname}-server"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
