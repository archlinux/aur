# Maintainer: Philipp Marmet <fujexo@c0d3.ch>
pkgname=gnome-shell-extension-headsetcontrol
pkgver=50.5
pkgrel=0
pkgdesc="Gnome Shell Extension to visualize headset status from HeadsetControl "
arch=('any')
url="https://github.com/ChrisLauinger77/gnome-shell-extension-HeadsetControl"
license=('GPL')
depends=('gnome-shell' 'headsetcontrol')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d7030476618484543862081aae9cfbe2d5e9f7a1b9a19540440628787a4e82e')
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
