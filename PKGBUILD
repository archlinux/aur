# Maintainer: Jordan Maris  <evangelos@foutrelis.com>

pkgname=xfce4-panel-sanetrayspacing
pkgver=4.12.1
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with sane tray spacing."
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
provides=("xfce4-panel=${pkgver%%.r*}")
conflicts=('xfce4-panel')
makedepends=('intltool' 'gtk-doc')
source=(http://archive.xfce.org/src/xfce/xfce4-panel/${pkgver%.*}/xfce4-panel-$pkgver.tar.bz2)
sha256sums=('93d58b80cca9c9eb58adb281bc75404df7cf6cae89f7f98bb9f38690009aa2e8')

build() {
  cd "$srcdir/xfce4-panel-$pkgver"
  patch plugins/systray/systray-box.c ../../spacing.patch
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/xfce4-panel-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
