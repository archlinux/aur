# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: StormBlast <stormblast@land.ru>

pkgname=tangerine-icon-theme
pkgver=0.27
pkgrel=7
pkgdesc="Ubuntu's twist on the Tango icon theme"
arch=('any')
url="https://launchpad.net/tangerine-icon-theme/"
license=('custom:cc-by-sa-2.5')
depends=('gnome-icon-theme' 'gtk-update-icon-cache')
makedepends=('intltool' 'gettext' 'imagemagick' 'icon-naming-utils' 'librsvg')
source=(http://archive.ubuntu.com/ubuntu/pool/main/t/$pkgname/${pkgname}_$pkgver.tar.gz
        archlinux-icon-crystal-{16,22,32}.png
        archlinux-icon-crystal-48.svg)
sha256sums=('4842f55143694a4d5b12517ff0b53d3dac1a67413b32c4a46bbf1b4b805f5489'
            'bf8a8e2b78a426412460fd87994d61d7085ccda46a86a6bc32b5115bff4a502d'
            '62441ff422ad662da601794acb8c39c5136dd3655ef20ba1e361d6397fe5c051'
            '84620a8abb4b1837d41471bd0bc0dececd252b5068e6aab82b4fdb753e9c1a7a'
            '6c5307e8a8ae06970c16278db557184dd91366bf6233ca55d2b7de942e66b821')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Replace Ubuntu's logo with Arch Linux's
  for size in 16 22 32; do
    cp "$srcdir/archlinux-icon-crystal-48.svg" \
      "$pkgdir/usr/share/icons/Tangerine/${size}x$size/places/start-here.png"
  done
  install -Dm644 "$srcdir/archlinux-icon-crystal-48.svg" \
    "$pkgdir/usr/share/icons/Tangerine/scalable/places/start-here.svg"
}

# vim:set ts=2 sw=2 et:
