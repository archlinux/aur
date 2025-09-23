# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-wiggle
pkgver=5
pkgrel=5
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
        "7c9bdd57949b599831161449ed221f738b8b1b2a950b5555aed6d0f7ec14cb6809d59b96d9886917963c7673464a9b65c16e2b664448c25ed7e5cb3b4f31e717")

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
