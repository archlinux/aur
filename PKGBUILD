# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=ddc-controls-bin
_pkgname=ddc-controls
pkgver=0.1.0
pkgrel=1
pkgdesc='GTK3 monitor control panel for DDC/CI (libddcci) and backlights, with a waybar module (prebuilt)'
arch=('x86_64')
url='https://github.com/TheElevatedOne/ddc-controls'
license=('GPL-3.0-or-later')
depends=(
  'atkmm'
  'glib2'
  'glibc'
  'glibmm'
  'gtkmm3'
  'libgcc'
  'libsigc++'
  'libstdc++'
)
optdepends=(
  'brightnessctl: control backlight panels without DDC/CI'
  'i2c-tools: i2c group and /dev/i2c-* permissions for DDC/CI'
  'waybar: status bar module (ddc-controls waybar)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Built by the upstream release workflow; libddcci is linked in statically.
options=('!debug')
source=("$_pkgname-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums=('9ec3c88f3f2cac670d95f03dd6d0b9ddfc353aca6c4a1e26235448d730d871be')

package() {
  cd "$_pkgname-$pkgver-x86_64-linux"
  install -Dm755 usr/bin/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/$_pkgname/waybar-module.jsonc usr/share/$_pkgname/waybar-style.css \
    -t "$pkgdir/usr/share/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
