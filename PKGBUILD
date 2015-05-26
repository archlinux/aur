# Maintainer: rilian-la-te <ria.freelander@gmail.com>

pkgbase=xfce4-sntray-plugin
pkgname=('xfce4-sntray-plugin' 'vala-panel-sntray' 'xfce4-sntray-plugin-translations')
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.3.14
pkgrel=1
pkgdesc="Plugin for xfce4-panel and vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
url="https://github.com/rilian-la-te/xfce4-sntray-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cmake' 'vala' 'gtk3' 'xfce4-panel>=4.11.2' 'vala-panel-git')
source=("https://github.com/rilian-la-te/xfce4-sntray-plugin/releases/download/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('e8d592f606ebeecbac784e2471db4a1fedf922c1a3ebb511af74c29bf76eecdd')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package_xfce4-sntray-plugin() {
  pkgdesc="Plugin for xfce4-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
  depends=('gtk3' 'xfce4-panel>=4.11.2')
  optdepends=('vala-panel-extras-volume: ALSA volume applet'
            'vala-panel-extras-battery: UPower battery applet'
            'vala-panel-extras-weather: Weather applet'
            'vala-panel-extras-xkb: XKB applet'
            'sni-qt: Qt applications for StatusNotifier'
            'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
            'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/vala-panel"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
}
package_vala-panel-sntray() {
  pkgdesc="Plugin for vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
  depends=('gtk3' 'vala-panel' 'libpeas')
  install=vala-panel-sntray.install
  optdepends=('vala-panel-extras-volume: ALSA volume applet'
            'vala-panel-extras-battery: UPower battery applet'
            'vala-panel-extras-weather: Weather applet'
            'vala-panel-extras-xkb: XKB applet'
            'sni-qt: Qt applications for StatusNotifier'
            'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
            'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
}
package_xfce4-sntray-plugin-translations() {
  pkgdesc="Translations for StatusNotifier Menu"
  optdepends=('vala-panel-sntray-plugin'
              'xfce4-sntray-plugin')
  arch=('any')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C "po" DESTDIR="${pkgdir}" install
}
