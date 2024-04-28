# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-panel-corners
_uuid=panel-corners@aunetx
pkgver=10
pkgrel=1
pkgdesc="A gnome-shell extension to keep the old topbar corners, which were removed for GNOME 42"
arch=('any')
url="https://github.com/aunetx/panel-corners"
license=('GPL-3.0-or later')
depends=('gnome-shell')
makedepends=('zip')
source=("panel-corners-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e57e10a52249a59a6076f65f42e4707b605c3c1cc833af75bae0afd486266b8')

build() {
  cd "panel-corners-$pkgver"
  make build
}

package() {
  cd "panel-corners-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "pkg/${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.panel-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
