# Maintainer: Isaac Angello <isaac.angello@gmail.com>
pkgname=waydroid-binds
pkgver=1.5.0
pkgrel=1
pkgdesc="GUI and scripts for Waydroid shared folders and firewall"
arch=('any')
url="https://github.com/isaacangello/WaydroidBinds"
license=('GPL3')
depends=('python' 'pyside6')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/isaacangello/WaydroidBinds/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f74b2ad21b6a73dfbe5f74cf0324ec746a788d415499c7a2759f9cdf76b1b2da')

_srcdir="WaydroidBinds-${pkgver}"

prepare() {
  cd "${_srcdir}"
}

check() {
  cd "${_srcdir}"
  python3 -m py_compile gui/*.py
}

package() {
  cd "${_srcdir}"
  install -dm 0755 "$pkgdir/usr/bin"
  install -dm 0755 "$pkgdir/usr/share/waydroid-binds"
  install -m 0755 waydroid-binds-gui "$pkgdir/usr/bin/waydroid-binds-gui"
  install -m 0755 setup-waydroid-binds.sh setup-waydroid-firewall.sh \
    revert-waydroid-binds.sh copy-existing-media.sh \
    "$pkgdir/usr/share/waydroid-binds/"
  cp -a gui "$pkgdir/usr/share/waydroid-binds/"
  install -dm 0755 "$pkgdir/usr/share/applications" "$pkgdir/usr/share/metainfo" "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 gui/resources/io.github.isaacangello.waydroidbinds.desktop "$pkgdir/usr/share/applications/"
  install -m 0644 gui/resources/io.github.isaacangello.waydroidbinds.metainfo.xml "$pkgdir/usr/share/metainfo/"
  install -dm 0755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m 0644 gui/resources/io.github.isaacangello.waydroidbinds.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}