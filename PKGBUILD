# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.23
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='https://www.tuxpaint.org/'
license=('GPL-2.0-only')
depends=('fltk' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libpaper' 'libunibreak' 'pango')
optdepends=('tuxpaint: ability to use tuxpaint provided fonts')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('95d7502a1b29fbf0e157793e634197bf08a6b6ae3f604e2991d117d2fae70135')

build() {
  make -C "$pkgname-$pkgver" CFLAGS="$CFLAGS $LDFLAGS" PREFIX=/usr
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
