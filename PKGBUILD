# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.25
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='https://www.tuxpaint.org/'
license=('GPL-2.0-only')
depends=('fltk' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libpaper' 'libunibreak' 'pango')
optdepends=('tuxpaint: ability to use tuxpaint provided fonts')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('8d46ac80ff962b3a962bc2979926e7564065df0ce08bcc0bd8c671913b975c99')

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
