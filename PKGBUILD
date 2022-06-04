# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.19
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='http://www.tuxpaint.org/' # no https available
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext' 'libunibreak')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('2ba2039ee6700fe7193c74342d07cc271ce307a15f8d4816406e2e75206ae11b')

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
