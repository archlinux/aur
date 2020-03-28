# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=st-jfchevrette
_pkgname=st
pkgver=0.8.2
pkgrel=2
pkgdesc="A simple terminal implementation for X"
url="http://st.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
provides=(st)
conflicts=(st)
install=st.install
source=(http://dl.suckless.org/st/st-${pkgver}.tar.gz
        config.h)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '52904e50c591ae3cf46420189d64a323f45cf3ea82b0179cd392744732df3c7a')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp "${srcdir}/config.h" config.h
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/${_pkgname}/README"
}
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            'd1b74290829e2f0713f3055b82b3c0e456d87e2ab966566370505b726e890ca8')
