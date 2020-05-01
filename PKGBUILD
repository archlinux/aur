# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.14
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='http://www.tuxpaint.org/' # no https available
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('cfc8e8ff4240eccddfd14a58be0adcedb09306ac6ec2f707b90c5b33c8ec6f7e')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin/" \
    "$pkgdir/opt/kde/share/icons/hicolor/"{16x16,32x32,48x48}"/apps/"
 make PREFIX="$pkgdir/usr" DESTDIR="$pkgdir" KDE_PREFIX="$pkgdir/opt/kde" \
   KDE_ICON_PREFIX="$pkgdir/opt/kde/share/icons" install
 install -Dm644 src/tuxpaint-config.desktop \
   "$pkgdir/usr/share/applications/tuxpaint-config.desktop"
}

# vim: ts=2 sw=2 et:
