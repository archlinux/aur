# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=mangband
pkgver=1.5.2
pkgrel=1
pkgdesc='A free online multiplayer real-time roguelike game, derived from the single player game Angband (ncurses-only)'
arch=('i686' 'x86_64')
url='http://www.mangband.org/'
license=('GPL' 'custom')
depends=('ncurses5-compat-libs')

source=("http://mangband.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('4cb550a19535de739d014d1a6e57353c')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CFLAGS="-mtune=generic -pipe -fstack-protector-strong" \
    ./configure \
    --prefix=/usr \
    --with-gcu \
    --without-sdl \
    --without-x11

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -Dm755 "${pkgdir}/usr/share/"
  cp -a lib "${pkgdir}/usr/share/${pkgname}"
  rm -f "${pkgdir}/usr/share/${pkgname}/*/delete.me"
  install -Dm755 mangclient "${pkgdir}/usr/bin/mangclient"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
