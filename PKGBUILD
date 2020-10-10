# Maintainer: graysky <graysky AT archlinux DOT us>

pkgbase=kodi-standalone-service
pkgname=(kodi-standalone-x11-service kodi-standalone-gbm-service kodi-standalone-wayland-service)
pkgver=1.107
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('MIT')
install=readme.install
source=("$pkgbase-v$pkgver.tar.gz::https://github.com/graysky2/$pkgbase/archive/v$pkgver.tar.gz")
b2sums=('e28940bb2a19e55e3ff0115f45416235532272473a7f6e07d96f3d8b6162cbf67581347ea11239e9e98b6ce58170c8df6a8a12ad9bcc025f3bb39b87a3dc04e8')

package_kodi-standalone-x11-service() {
  replaces=('kodi-standalone-service')
  conflicts=('kodi-standalone-service')
  depends=('kodi-x11' 'polkit' 'xorg-server' 'xorg-xinit')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi-x11.service "$pkgdir/usr/lib/systemd/system/kodi-x11.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi-x11.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi-x11.conf"
}

package_kodi-standalone-gbm-service() {
  depends=('kodi-gbm' 'polkit' 'libinput')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi-gbm.service "$pkgdir/usr/lib/systemd/system/kodi-gbm.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi-gbm.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi-gbm.conf"
}

package_kodi-standalone-wayland-service() {
  depends=('kodi-wayland' 'polkit' 'libinput' 'cage')

  cd "$pkgbase-$pkgver"
  install -Dm644 init/kodi-wayland.service "$pkgdir/usr/lib/systemd/system/kodi-wayland.service"
  install -Dm644 init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi-wayland.conf"
  install -Dm644 init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi-wayland.conf"
}

# vim:set ts=2 sw=2 et:
