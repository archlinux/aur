# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.26
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=(x86_64)
url='https://www.tuxpaint.org/'
license=(GPL-2.0-only)
depends=(fltk fontconfig gcc-libs glibc hicolor-icon-theme
         libpaper libunibreak pango)
optdepends=('tuxpaint: ability to use tuxpaint provided fonts')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('f9ac5f2baf005e162841ceebc5ba0f77004fb05abe32354d5b26e3edc456e3b8')

build() {
  make -C "$pkgname-$pkgver" CFLAGS="$CFLAGS $LDFLAGS" PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make -j1 \
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
