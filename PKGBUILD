# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-freon
pkgver=25
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
sha512sums=('f62fa28fc1d866a4cad7e34b78cdbb434e10b0e606e47da7bbdc510fcbd093e34590c2f642a87103c40bd52eff1bc0885dc4795383e0821e723ca68b211e7c60')

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
