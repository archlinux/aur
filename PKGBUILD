# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-wiggle
pkgver=5
pkgrel=2
pkgdesc="Gnome extension that highlights the cursor position when the mouse is moved rapidly."
arch=("any")
url="https://github.com/mechtifs/wiggle"
license=("GPL-2.0-only")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:48")
options=("!strip" "!debug")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "wiggle-gnome48.patch")
b2sums=("ca12266b5efbea310e4a7cb214791472566ada4e95cbc38baec5cba2ab0467780e3288dcdd1f9c9e71e95aecf8a075c11ade8682eb3cd141c5f452079988ee57"
        "4b3e456bd7e5c7e6a29f1322d2690572665ae34200834f3e778b7d4746764566b554a1b549b7307b83bdece9abbf3aa797264be2954ac38b7439fb76fa2b8bec")

_uuid="wiggle@mechtifs"

prepare() {
  cd wiggle-$pkgver
  patch -Np2 -i ../wiggle-gnome48.patch
}

package() {
  cd wiggle-$pkgver

  install -Dm644 schemas/*gschema.* -t  "$pkgdir/usr/share/glib-2.0/schemas"
  install -D *.js* -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  install -D icons/cursor.svg -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/icons"
}
