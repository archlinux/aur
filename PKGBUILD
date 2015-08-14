# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=ponscripter
pkgver=20111009
pkgrel=2
pkgdesc="NScripter-style novel-game interpreter with an emphasis on supporting games in Western languages"
arch=('i686' 'x86_64')
url="http://onscripter.unclemion.com/"
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'freetype2' 'gcc-libs')
# Dependency 'smpeg' 'bzip2' already satisfied
source=(http://unclemion.com/dev/attachments/download/48/$pkgname-$pkgver-src.tar.bz2)
md5sums=('52927f2a57abe430d86ff4ac05ab7960')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  sed -i "36i\#include <unistd.h>" ./src/AnimationInfo.h
  ./configure --prefix=/usr --no-werror
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}-src/src/ponscr" "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  install -m644 BUGS CHANGES INSTALL MANUAL README TODO "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
