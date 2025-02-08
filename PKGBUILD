# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-auto-accent-color
_uuid=auto-accent-colour@Wartybix
pkgver=14
pkgrel=1
pkgdesc="GNOME extension to automatically change the desktop accent colour based on the user's wallpaper."
arch=('any')
url="https://github.com/Wartybix/GNOME-Auto-Accent-Colour"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
provides=('gnome-shell-extension-auto-accent-colour')
source=("GNOME-Auto-Accent-Colour-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c1ef8127cd95223543aa3e4a0214a0ea2eb3deb40b35a46dd38b36e607dbb9fb')

build() {
  cd "GNOME-Auto-Accent-Colour-$pkgver"
  gnome-extensions pack \
    --extra-source=color-thief/ \
    --extra-source=icons/ \
    --extra-source=utils.js \
    --extra-source=cache.js \
    --force
}

package() {
  cd "GNOME-Auto-Accent-Colour-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.auto-accent-colour.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
