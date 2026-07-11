# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — power-profile listener. Watches
# `/sys/firmware/acpi/platform_profile` (the kernel attribute that
# `power-profiles-daemon` and `tuned` proxy via D-Bus) and fires an
# OSD on every profile change: performance / balanced / low-power
# (plus vendor-specific names like quiet / cool).
#
# No D-Bus dependency — the listener reads the sysfs attribute
# directly and uses inotify + a polling backstop. On laptops without
# `platform_profile` (older or virtualised) the listener stays in
# its rescan loop and never fires.
#
# 0.1.7 and e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-power-profile-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="awob listener: power profile"
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-power-profile')
conflicts=('awob-listener-power-profile' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-power-profile
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
