# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.21
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='https://www.tuxpaint.org/'
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext' 'libunibreak')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('5287de38944c302a7eaa069c8f5de635b95d82912e6cdf195c66366bf3431ae8')

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
