# Maintainer: Mark wagie <mark dot wagie at proton dot me>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
pkgname=gnome-shell-extension-gtile
_uuid=gTile@vibou
pkgver=59
pkgrel=1
pkgdesc="A window tiling extension for GNOME Shell"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'npm' 'typescript')
source=("https://github.com/gTile/gTile/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('656321eef2c1b7d4b1749f330dce9c73ec7a8b4b8847317a66797d99ee8663e1')

build() {
  cd gTile-$pkgver
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build
  npm run build:dist
}

package() {
  cd gTile-$pkgver
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf gtile.dist.tgz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 dist/schemas/org.gnome.shell.extensions.gtile.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
