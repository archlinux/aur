# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxqt-dev
pkgver=3.1.5
pkgrel=1
pkgdesc='Qt implementation of wxWidgets API for GUI'
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
depends=('libsecret' 'qt5-base')
makedepends=('glu')
conflicts=('wxgtk-common')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('725455d6324baa808259b56a42199237327e0638')
sha256sums=('d7b3666de33aa5c10ea41bb9405c40326e1aeb74ee725bb88f90f1d50270a224')

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
