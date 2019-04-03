# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xsnow
pkgver=1.42
pkgrel=7
pkgdesc="Display snow, Santa and his reindeers on the root window"
arch=('x86_64')
url="https://janswaal.home.xs4all.nl/Xsnow/"
license=('custom')
depends=('libxpm')
makedepends=('imake')
source=(https://janswaal.home.xs4all.nl/Xsnow/xsnow-$pkgver.tar.gz LICENSE)
sha1sums=('d63987560dac9c6341e50d270089e40d17031ce3'
          'c93e236bed35a2d5dc23202c1c615d4e146fba49')

build() {
  cd ${pkgname}-${pkgver}
  xmkmf
  make depend
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install install.man
  chmod 644 "${pkgdir}/usr/share/man/man1/xsnow.1x"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
