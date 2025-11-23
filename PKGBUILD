# Maintainer: Philipp Marmet <fujexo@c0d3.ch>
pkgname=gnome-shell-extension-headsetcontrol
pkgver=49.5
pkgrel=0
pkgdesc="Gnome Shell Extension to visualize headset status from HeadsetControl "
arch=('any')
url="https://github.com/ChrisLauinger77/gnome-shell-extension-HeadsetControl"
license=('GPL')
depends=('gnome-shell' 'headsetcontrol')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfe066f05fb1944714b8663f10575673746e07ea28d5c712e2ee61487021f710')
_extension_name="HeadsetControl@lauinger-clan.de"
_source_name="gnome-shell-extension-HeadsetControl"

package() {
  cd "$_source_name-$pkgver"
  glib-compile-schemas "HeadsetControl@lauinger-clan.de/schemas"
  gnome-extensions pack "${_extension_name}" --podir="../po" --extra-source="../LICENSE" --force

  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/${_extension_name}"
  bsdtar -xvf "${_extension_name}.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${_extension_name}"
  cp "HeadsetControl@lauinger-clan.de/schemas/gschemas.compiled" "$pkgdir/usr/share/gnome-shell/extensions/${_extension_name}/schemas/gschemas.compiled"
}
