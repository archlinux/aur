# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-wiggle
pkgver=5
pkgrel=3
pkgdesc="Gnome extension that highlights the cursor position when the mouse is moved rapidly."
arch=("any")
url="https://github.com/mechtifs/wiggle"
license=("GPL-2.0-only")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:46")
options=("!strip" "!debug")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "wiggle-gnome48.patch")
b2sums=("ca12266b5efbea310e4a7cb214791472566ada4e95cbc38baec5cba2ab0467780e3288dcdd1f9c9e71e95aecf8a075c11ade8682eb3cd141c5f452079988ee57"
        "c8dca9124ccc79da9b22a0d23f27b698eeddd5fef8ba927d288f62030bff02848bf5d8a861407edd0d2803814c58c6d34ed7b866ed983c75a6b45914690e8be5")

_uuid="wiggle@mechtifs"

prepare() {
  cd wiggle-$pkgver
  patch -Np1 -i ../wiggle-gnome48.patch
}

package() {
  cd wiggle-$pkgver

  install -Dm644 schemas/*gschema.* -t  "$pkgdir/usr/share/glib-2.0/schemas"
  install -D *.js* -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  install -D icons/cursor.svg -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/icons"
}
