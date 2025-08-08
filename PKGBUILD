# Maintainer: Philipp Marmet <fujexo@c0d3.ch>
pkgname=gnome-shell-extension-headsetcontrol
pkgver=49.0
pkgrel=1
pkgdesc="Gnome Shell Extension to visualize headset status from HeadsetControl "
arch=('any')
url="https://github.com/ChrisLauinger77/gnome-shell-extension-HeadsetControl"
license=('GPL')
depends=('gnome-shell' 'headsetcontrol')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1890bf6b5e2586df6fcb556340ee52449b63d90165a400a6468123413c0e7ce')
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
