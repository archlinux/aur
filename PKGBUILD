# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxqt-dev
pkgver=3.1.4
pkgrel=2
pkgdesc='Qt implementation of wxWidgets API for GUI'
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
depends=('libsecret' 'qt5-base')
makedepends=('glu')
conflicts=('wxgtk-common')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('f8c77e6336b5f6414b07e27baa489fb8abc620c4')
sha256sums=('3ca3a19a14b407d0cdda507a7930c2e84ae1c8e74f946e0144d2fa7d881f1a94')

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
