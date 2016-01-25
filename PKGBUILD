# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=tp-battery-icon-git
_pkgname=tp-battery-icon
pkgver=r21.0cbd6e7
pkgrel=1
pkgdesc="A simple yet powerful tray icon, using tp_smapi or acpi_call."
arch=('any')
url="https://github.com/phragment/tp-battery-icon"
license=('GPL3')
depends=('python' 'python-gobject')
optdepends=('tp_smapi: support for pre Sandy Bridge ThinkPads'
            'acpi_call: support for newer ThinkPads')
makedepends=('git')
provides=('tp-battery-icon')
conflicts=('tp-battery-icon')
install=tp-battery-icon.install
source=('tp-battery-icon::git+https://github.com/phragment/tp-battery-icon.git'
        'tp-battery-icon.desktop'
        '90-tp_smapi.rules'
        '90-acpi_call.rules')
md5sums=('SKIP'
         '55013014907d603bc3b1621cbf17f92c'
         'db0364032a7d0625bcc27f519428f9ff'
         '67f7ee0c792f515195fba26d26449ca6')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m755 "tp-battery-icon.py" "$pkgdir/usr/bin/tp-battery-icon"
  install -D -m644 "tp-battery-icon.svg" "$pkgdir/usr/share/pixmaps/tp-battery-icon.svg"
  cp -r "icons/" "$pkgdir/usr/share/pixmaps/tp-battery-icons/"

  install -D -m644 "$srcdir/tp-battery-icon.desktop" "$pkgdir/usr/share/applications/tp-battery-icon.desktop"
  install -D -m644 "$srcdir/tp-battery-icon.desktop" "$pkgdir/etc/xdg/autostart/tp-battery-icon.desktop"

  install -D -m644 "$srcdir/90-tp_smapi.rules" "$pkgdir/usr/lib/udev/rules.d/90-tp_smapi.rules"
  install -D -m644 "$srcdir/90-acpi_call.rules" "$pkgdir/usr/lib/udev/rules.d/90-acpi_call.rules"
}

# vim:set ts=2 sw=2 et:
