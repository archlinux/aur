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
# 0.1.5 and f3b8d0b21f7a4d8a0603083a478a04ec7c4da1dc975a1f4ffe609beb71573327 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-power-profile-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="awob listener — ACPI platform_profile → OSD."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-power-profile')
conflicts=('awob-listener-power-profile' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f3b8d0b21f7a4d8a0603083a478a04ec7c4da1dc975a1f4ffe609beb71573327')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-power-profile
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
