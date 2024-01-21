# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
# Contributor: Mark wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile
_uuid=gTile@vibou
pkgver=56
pkgrel=1
pkgdesc='A window tiling extension for GNOME Shell'
url='https://github.com/gTile/gTile'
arch=('any')
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('npm' 'typescript')
source=("https://github.com/gTile/gTile/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3e3493ff79e203b9c6cfe391f46e9d5c9327ebc6256ce747cba7163bd6c49a2a')

build() {
  cd gTile-$pkgver
  npm install
  tsc
  rm -rf dist/types
}

package() {
  cd gTile-$pkgver
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  install -dm755 "$pkgdir/usr/share/glib-2.0"
  cp -a dist "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$pkgdir/usr/share/glib-2.0"
}

# vim: ts=2 sw=2 et:
