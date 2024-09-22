# Maintainer: Mark wagie <mark dot wagie at proton dot me>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
pkgname=gnome-shell-extension-gtile
_uuid=gTile@vibou
pkgver=61
pkgrel=1
pkgdesc="A window tiling extension for GNOME Shell"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'npm' 'typescript')
source=("https://github.com/gTile/gTile/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a3e204366abacc7e8072863b689dfb551391d0b8ddfa059398da79eba26ba07e')

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
