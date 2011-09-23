# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=trayer
pkgver=1.0
pkgrel=6
pkgdesc="A lightweight GTK2-based systray"
arch=('i686' 'x86_64')
url="https://gna.org/projects/fvwm-crystal/"
license=('GPL' 'MIT')
depends=('gtk2')
makedepends=('libxmu')
options=('!makeflags')
source=(http://download.gna.org/fvwm-crystal/trayer/${pkgver}/${pkgname}-${pkgver}.tar.gz
        trayer.diff manpage.diff)
md5sums=('e1b0b6464f991f2c296561e377585867'
         '7f66eee885563871f9f76646bca6b14d'
         '3f1c92bbe275f186b613c04a47e8e977')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../trayer.diff
  patch -p1 -i ../manpage.diff
  sed -i 's/$(LIBS) $(OBJ) $(SYSTRAYOBJ)/$(OBJ) $(SYSTRAYOBJ) $(LIBS)/' Makefile
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  install -D -m644 trayer.1 "${pkgdir}/usr/share/man/man1/trayer.1"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
