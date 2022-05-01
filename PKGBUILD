# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxgtk3-audacity
pkgver=3.1.5
pkgrel=1
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
pkgdesc='Common libraries and headers for wxgtk3 GTK+3 implementation of wxWidgets API for GUI'
makedepends=('gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify')
depends=('gtk4' 'gst-plugins-base-libs' 'libsm')
optdepends=('webkit2gtk: for webview support')
conflicts=('wxgtk-common' 'wxgtk' 'wxgtk3')
provides=('wxgtk-common' 'wxgtk' 'wxgtk3')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2")
md5sums=('8b2ac42364a02bb5f3df22e1b1a517e5')

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --disable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers
  make
}

package() {
  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
