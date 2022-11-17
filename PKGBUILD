#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=dwire-debug-git
_pkgname=dwire-debug
pkgver=r169.a2830d5
pkgrel=1
pkgdesc="Simple stand-alone debugger for ATtiny 45 and other ATMEL AVR DebugWIRE chips connected directly to an FT232R or similar"
arch=("i686" "x86_64")
url="https://github.com/dcwbrown/dwire-debug"
license=("GPL2")
depends=("gtk3")
conflict=("dwire-debug")
source=("git+https://github.com/dcwbrown/dwire-debug.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # workaround for non-existing posix streams include file (stropts.h) on linux
  #touch stropts.h
  #make dwdebug CC="gcc -I." || return 1

  make dwdebug || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  #make DESTDIR="${pkgdir}/" install
  install -D --mode=0755 dwdebug "${pkgdir}/usr/bin/dwdebug"
}

#
# EOF
#
