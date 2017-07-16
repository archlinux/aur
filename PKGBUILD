#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=gdash-git
_pkgname=gdash
pkgver=r36.6507f37
pkgrel=1
pkgdesc="A Boulder Dash clone, intended to be as close to the original as possible."
arch=("i686" "x86_64")
url="https://bitbucket.org/czirkoszoltan/gdash.git"
license=("MIT")
depends=("gtk2" "sdl2" "sdl2_image" "sdl2_mixer")
conflict=("gdash")
source=("git+https://bitbucket.org/czirkoszoltan/gdash.git")
md5sums=('SKIP') 


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-gtk --with-sdl --enable-sound || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}

#
# EOF
#
