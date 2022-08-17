# Maintainer: Mirko Scholz <srtlg>
# wxgtk-3.1.5 maintainer: George Katevenis <george_kate[at]hotmail[dot]com>
# wxgtk-dev (non-opt) maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=wxgtk30
pkgver=3.0.5.1
pkgrel=1
pkgdesc='GTK+3 implementation of wxWidgets API for GUI, v3.0.5 installed in /opt/wxgtk-3.0.5/'
arch=('x86_64')
url="https://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('glu' 'webkit2gtk')
depends=('gtk3' 'libsm' 'zlib' 'gcc-libs' 'expat')
optdepends=('webkit2gtk: for webview support')
options=('!emptydirs')
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2"
        ${pkgname}.conf)
sha256sums=('440f6e73cf5afb2cbf9af10cec8da6cdd3d3998d527598a53db87099524ac807'
            'f89cd15e685a9614b1b5d55c202391a8eac81740c2bd1b51e53eb6362e9ffd80')

build() {
  cd wxWidgets-${pkgver}
  ./configure --prefix=/opt/wxgtk-3.0.5 --libdir=/opt/wxgtk-3.0.5/lib --with-gtk=3 --with-opengl --enable-unicode \
    --without-{libnotify,gnomevfs,gnomeprint} \
    --enable-graphics_ctx --disable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers --enable-compat28
  make
}

package() {
  cd wxWidgets-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644  ../${pkgname}.conf -t "${pkgdir}/etc/ld.so.conf.d/"
  install -D -m644 docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

