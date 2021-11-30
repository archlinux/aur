# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.18
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='http://www.tuxpaint.org/' # no https available
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext' 'libunibreak')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('a8c2f318ce9fefaa3dffeb7d2460e72d30078d0e3f5147c82ba0600a45cfa4b8')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make \
    PREFIX=/usr \
    GNOME_PREFIX=/usr \
    KDE_PREFIX="" \
    KDE_ICON_PREFIX="" \
    X11_ICON_PREFIX=/usr/share/pixmaps/ \
    DESTDIR="$pkgdir" \
    install

  install -Dm644 src/tuxpaint-config.desktop \
    "$pkgdir/usr/share/applications/tuxpaint-config.desktop"
}

# vim: ts=2 sw=2 et:
