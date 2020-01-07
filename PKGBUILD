# Maintainer: graysky <graysky AT archlinux DOT us>

pkgbase=kodi-standalone-service
pkgname=(kodi-standalone-service kodi-standalone-gbm-service)
pkgver=1.97
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('GPL')
install=readme.install
source=("https://github.com/graysky2/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('576caa9793d3c906774c4c44a97bde17aaa9de92ba1d2a1512733c2ab09093ea')

package_kodi-standalone-service() {
  depends=('kodi' 'polkit' 'xorg-server' 'xorg-xinit')
  conflicts=('kodi-standalone-gbm-service')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi.service "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi.conf"
}

package_kodi-standalone-gbm-service() {
  depends=('kodi-gbm' 'polkit' 'libinput')
  conflicts=('kodi-standalone-service')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi-gbm.service "$pkgdir/usr/lib/systemd/system/kodi-gbm.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi.conf"
}

# vim:set ts=2 sw=2 et:
