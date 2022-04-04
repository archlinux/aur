# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxqt-dev
pkgver=3.1.6
pkgrel=1
pkgdesc='Qt implementation of wxWidgets API for GUI'
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
depends=('libsecret' 'qt5-base')
makedepends=('glu')
conflicts=('wxgtk-common')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('266be7de43351e7d75c308f7f45469a5c433479c')
sha256sums=('4980e86c6494adcd527a41fc0a4e436777ba41d1893717d7b7176c59c2061c25')

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --with-qt --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo
}

package() {
  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
