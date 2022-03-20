# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=gnome-shell-extension-gsconnect
pkgver=49
pkgrel=1
pkgdesc="KDE Connect implementation with GNOME Shell integration"
arch=('any')
url="https://github.com/GSConnect/gnome-shell-extension-gsconnect"
license=('GPL')
makedepends=('meson' 'ninja' 'eslint' 'appstream')
depends=('gnome-shell')
optdepends=(
  'folks: Contacts integration (Evolution)'
  'libgdata: Contacts integration (GNOME Online Accounts)'
  'gsound: Themed sound effects'
  'python-nautilus: Nautilus integration'
)
source=(https://github.com/GSConnect/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('d8261392967b7ce4cdc8632bf84148466dc8e9bb3733a6ad0b8355b47c1e3d58')
_uuid='gsconnect@andyholmes.github.io'

build() {
  arch-meson -Dinstalled_tests=false -Dfirewalld=true -Dpost_install=true -Dgsettings_schemadir="/usr/share/gnome-shell/extensions/$_uuid/schemas" $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.Shell.Extensions.GSConnect.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas"
}
