# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

pkgname=omega
pkgver=0.80.2
pkgrel=1
pkgdesc="The classic Roguelike game."
arch=('i686' 'x86_64')
url="http://www.alcyone.com/max/projects/omega/"
license=("custom")
depends=('ncurses5-compat-libs' 'termcap')
md5sums=('6d65ec9e0cc87ccf89ab491533ec4b77')
source=(http://www.alcyone.com/binaries/omega/${pkgname}-${pkgver}-src.tar.gz)

build() {
  cd ${srcdir}/${pkgname}
  sed -i -e 's_#define OMEGALIB "./omegalib/"_#define OMEGALIB "/usr/lib/omegalib/"_g' defs.h
  sed -i -e 's_../omegalib_omegalib_g' Makefile
  sed -i -e '/omegahi.bak/d' Makefile
  make
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/omegalib"
  make BINDIR="${pkgdir}/usr/bin" LIBDIR="${pkgdir}/usr/lib/omegalib" install_not_suid
  mkdir -p "${pkgdir}/usr/share/licenses/omega/"
  mv "${pkgdir}/usr/lib/omegalib/license.txt" "${pkgdir}/usr/share/licenses/omega/LICENSE"
  ln -s "../../share/licenses/omega/LICENSE" "${pkgdir}/usr/lib/omegalib/license.txt"
  chmod 0755 "${pkgdir}/usr/bin/omega"
}
