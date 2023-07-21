# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.22
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='https://www.tuxpaint.org/'
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext' 'libunibreak')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('89953ce499fdc1ffa6bbf8514584420b4c843f8861e1c97df84c326e49f701d7')

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
