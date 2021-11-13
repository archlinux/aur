# Maintainer: Konstantin Köhring <konstantin.koehring@gmail.com>

pkgname=budgie-bluetooth-battery-applet
pkgver=r6.5265923
pkgrel=1
pkgdesc="Show the Battery percentage of a connected bluetooth device"
arch=('i686' 'x86_64')
url='https://github.com/GaLaXy102/budgie-bluetooth-battery-applet'
license=('GPL3')
depends=('budgie-desktop' 'python-gobject' 'python-bluetooth-battery')
install=budgie-bluetooth-battery-applet.install

source=("git+${url}" "budgie-bluetooth-battery-applet.install")
sha256sums=('SKIP' '867a3c59354ca6a79eee539cf15cc88e01937e513609624a673e40f68264b667')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _plugin_dir="${pkgdir}/usr/lib/budgie-desktop/plugins/budgie-bluetooth-battery-applet"
  _srcdir="${srcdir}/budgie-bluetooth-battery-applet"
  install -d "${_plugin_dir}"
  install -D -m644 "${_srcdir}/BudgieBluetoothBatteryApplet.plugin" "${_plugin_dir}/"
  install -D -m644 "${_srcdir}/budgie_bluetooth_battery_applet.py" "${_plugin_dir}/"

  _pixmaps_dir="${pkgdir}/usr/share/pixmaps"
  install -d "${_pixmaps_dir}"
  install -D -m644 "${_srcdir}/bluetooth-battery-applet-symbolic.svg" "${_pixmaps_dir}/bluetooth-battery-applet-symbolic.svg"

  _schema_dir="${pkgdir}/usr/share/glib-2.0/schemas"
  install -d "${_schema_dir}"
  install -D -m644 "${_srcdir}/schema/de.galaxy102.budgie.bluetooth-battery.gschema.xml" "${_schema_dir}/de.galaxy102.budgie.bluetooth-battery.gschema.xml"
}
