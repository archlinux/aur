# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-wiggle
pkgver=5
pkgrel=4
pkgdesc="Gnome extension that highlights the cursor position when the mouse is moved rapidly."
arch=("any")
url="https://github.com/mechtifs/wiggle"
license=("GPL-2.0-only")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:46")
options=("!strip" "!debug")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "wiggle-gnome49.patch")
b2sums=("ca12266b5efbea310e4a7cb214791472566ada4e95cbc38baec5cba2ab0467780e3288dcdd1f9c9e71e95aecf8a075c11ade8682eb3cd141c5f452079988ee57"
        "a6df9ae47d60250087092563694b6882155eab8dbe7be043bcbec7201de1ab2ac5e071510b9782f6ddbf08b8c3d2a6660a394e634fb9ac3e75f0f84f0575821f")

_uuid="wiggle@mechtifs"

prepare() {
  cd wiggle-$pkgver
  patch -Np1 -i ../wiggle-gnome49.patch
}

package() {
  cd wiggle-$pkgver

  install -Dm644 schemas/*gschema.* -t  "$pkgdir/usr/share/glib-2.0/schemas"
  install -D *.js* -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  install -D icons/cursor.svg -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/icons"
}
