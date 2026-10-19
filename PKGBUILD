# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>

_name=quick-settings-audio-panel
_uuid=$_name@rayzeq.github.io

pkgname=gnome-shell-extension-$_name
pkgver=106
pkgrel=1
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL-3.0-or-later')
source=("v$pkgver.zip::https://github.com/Rayzeq/$_name/releases/download/v$pkgver/$_uuid.shell-extension.zip")
sha256sums=('ea71844e212938e889c8ecc4ae75a92513def9318e20818a3073c4e9e2546e24')
depends=('gnome-shell')
makedepends=('glib2' 'npm')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xf "v$pkgver.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
