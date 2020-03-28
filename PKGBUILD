# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=mangband
pkgver=1.5.3
pkgrel=1
pkgdesc='A free online multiplayer real-time roguelike game, derived from the single player game Angband (ncurses-only)'
arch=('i686' 'x86_64')
url='http://www.mangband.org/'
license=('GPL' 'custom')
depends=('ncurses5-compat-libs')

source=("https://mangband.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('d0e62faf191e6acd23c70a1f70a40685')


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
