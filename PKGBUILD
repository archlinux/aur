# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=mangband
pkgver=1.1.3
pkgrel=1
pkgdesc='A free online multiplayer real-time roguelike game, derived from the single player game Angband (ncurses-only)'
arch=('i686' 'x86_64')
url='http://www.mangband.org/'
license=('GPL' 'custom')
depends=('ncurses5-compat-libs' 'libtinfo-5')

source=("http://mangband.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('f1cc146cc1cddcfb09c2a30f7936c165')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
