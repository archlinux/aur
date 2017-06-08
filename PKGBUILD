# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-freon
pkgver=24
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
conflicts=('gnome-shell-extensions-git')
install="gschemas.install"
source=("${pkgname}::https://github.com/UshakovVasilii/gnome-shell-extension-freon/archive/EGO-${pkgver}.tar.gz")
sha512sums=('841bb17ae13c07a263c3dd7c314151fe0ef17fce7be5da5bc00cabd3a7fbfb0ccbbd8dd2d2b04c21c2b3113de17105edc55adf8d50f003cdbacbde144dc29bfa')

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
