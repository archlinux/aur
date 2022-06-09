# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxqt-dev
pkgver=3.1.7
pkgrel=1
pkgdesc='Qt implementation of wxWidgets API for GUI'
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
depends=('libsecret' 'qt5-base')
makedepends=('glu')
conflicts=('wxgtk-common')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('893e7886bc1e9fcf691bd4db0c9e49dc8413f674')
sha256sums=('3d666e47d86192f085c84089b850c90db7a73a5d26b684b617298d89dce84f19')

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
