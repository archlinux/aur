# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Contributer: Eric Cheng <eric at chengeric dot com>
pkgname=gnome-shell-extension-alphabetical-grid-extension
_uuid=AlphabeticalAppGrid@stuarthayhurst
pkgver=42.0
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
source=("alphabetical-grid-extension-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37674c26b13f3f0f0d2854aaf9fd3c1626fe9c88f4c6a3230c949efa3ce24413')

build() {
  cd alphabetical-grid-extension-$pkgver
  make build
}

package() {
  cd alphabetical-grid-extension-$pkgver

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 "extension/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/LICENSE.txt"
}
