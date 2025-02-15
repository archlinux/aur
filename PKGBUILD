# Maintainer: Marco Costanzo <thedumberspacecore096 at gmail dot com>
pkgname=yogabook-initcpio-hook
pkgver=1.0
pkgrel=2
pkgdesc="YogaBook touch keyboard handler hook for initcpio"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(yogabook-touch-keyboard)
source=(yb-keyboard cleanuphook 60-touch-keyboard.rules yb-kbd-handler.sh)
sha256sums=('f3e8582e226a291100919076936e7d05649f139a5d6e769c7df208a58cba0970'
            '46304511f106267a1d974c0815c7ccb1c534c64c498d1dcdbdb664dc1d4731f0'
            'f691dc2684593a48f9c8129e1bdf3103174fa6297c94c7679180a891b028e583'
            '069722735504c6493ab6bee8ac39d4d300555730ecd588e85a3e133d40a68260')

package() {
  local install_hook_name="${source[0]}"
  local cleanup_hook_name="${source[1]}"
  local udev_rule="${source[2]}"
  local helper_script="${source[3]}"

  install -Dm644 -t "$pkgdir/usr/lib/initcpio/install" ${install_hook_name}
  install -Dm644 -T ${cleanup_hook_name} "$pkgdir/usr/lib/initcpio/hooks/${install_hook_name}"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" ${udev_rule}
  install -Dm755 -t "$pkgdir/usr/share/$pkgname" ${helper_script}
}
