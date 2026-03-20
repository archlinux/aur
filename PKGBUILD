# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=plsnocompute
pkgver=1
pkgrel=2
pkgdesc="Masks resource-draining user services so they don't run."
arch=(any)
url="https://codeberg.org/ltdk/plsnocompute"
license=(CC0-1.0)
depends=(systemd)
source=()
sha256sums=()

package() {
  user_mask=(
    drkonqi-coredump-cleanup.service
    drkonqi-coredump-cleanup.timer
    drkonqi-coredump-launcher@.service
    drkonqi-coredump-launcher.socket
    drkonqi-coredump-pickup.service
    drkonqi-sentry-postman.path
    drkonqi-sentry-postman.service
    drkonqi-sentry-postman.timer
    kde-baloo.service
    localsearch-3.service
    localsearch-control-3.service
    localsearch-writeback-3.service
    plasma-baloorunner.service
  )
  system_mask=(
    drkonqi-coredump-processor@.service
  )

  install -m755 -d "$pkgdir"/etc/systemd/system/
  install -m755 -d "$pkgdir"/etc/systemd/user/

  for unit in "${user_mask[@]}"; do
    ln -s /dev/null "$pkgdir/etc/systemd/user/$unit"
  done
  for unit in "${system_mask[@]}"; do
    ln -s /dev/null "$pkgdir/etc/systemd/system/$unit"
  done
}
