# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tim Yang <protonmail = timdyang>
pkgname=gnome-shell-extension-x11gestures
_uuid=x11gestures@joseexposito.github.io
pkgver=24
pkgrel=1
pkgdesc="Enable GNOME Shell multi-touch gestures on X11"
arch=('any')
url="https://github.com/JoseExposito/gnome-shell-extension-x11gestures"
license=('GPL-2.0-or-later')
depends=('gnome-shell' 'touchegg')
makedepends=('git')
source=("git+https://github.com/JoseExposito/gnome-shell-extension-x11gestures.git#tag=$pkgver")
sha256sums=('e7c85eef996cdacf84f97679f24ca9c0fe68e75cd05b75b6013b1f4d4e4b1e15')

build() {
  cd "$pkgname"
  gnome-extensions pack \
    --extra-source=src/ \
    --force
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.x11gestures.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
