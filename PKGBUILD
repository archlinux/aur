# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-freon
pkgver=15
pkgrel=1
pkgdesc="Displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidia/Catalyst), voltage and fan RPM in a GNOME Shell top bar pop-down."
arch=('any')
url="https://github.com/UshakovVasilii/gnome-shell-extension-freon"
license=('GPL')
depends=('dconf' 'gnome-shell' 'lm_sensors')
makedepends=('gnome-common' 'intltool')
optdepends=(
  'udisks2: optional backend for storage temperature sensors.'
  'hddtemp: optional backend for S.M.A.R.T. temperature sensors.'
)
provides=('gnome-shell-extension-freon')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extensions-freon')
install="gschemas.install"
source=("${pkgname}::https://github.com/UshakovVasilii/gnome-shell-extension-freon/archive/EGO-15.tar.gz")
sha512sums=('09b4ac37391367d2dd56eb61599ce6bb6fdd2f4a7e6aa6acc6cd9afcbe81977b7ab3dec7cc74e3162eaaf425f26cfe55b9e448bb309692cf109de230cfbc93fa')

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
}
