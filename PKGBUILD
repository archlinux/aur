# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname=gnome-shell-extension-forge
_uuid=forge@jmmaranan.com
pkgver=83
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/forge-ext/forge.git#tag=v46-$pkgver")
sha256sums=('53463ae08311732a8b8863a214c5d8f0dcb960d2d9cd44053676534b42d0f14c')

build() {
  cd forge
  make build
}

package() {
  cd forge
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
