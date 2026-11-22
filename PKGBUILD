# Maintainer: Marco Ziliani (rylos)
# AUR: rynas-agent-bin (the static binary of the GitHub release). Copy to PKGBUILD in the AUR
# repository; `pkgver` and the checksums follow each release.
pkgname=rynas-agent-bin
pkgver=0.8.29
pkgrel=1
pkgdesc="rynas PC backup agent: file backups to a rynas NAS and bare-metal restore from any live Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rylos/rynas"
license=('AGPL-3.0-or-later')
provides=('rynas-agent')
conflicts=('rynas-agent')
optdepends=('btrfs-progs: btrfs snapshots and restores'
            'lvm2: LVM snapshots'
            'dosfstools: restoring an ESP'
            'cryptsetup: restoring LUKS volumes')
source=("rynas-agent.service::https://raw.githubusercontent.com/rylos/rynas/v${pkgver}/packaging/agent/rynas-agent.service")
source_x86_64=("rynas-agent-x86_64-${pkgver}::https://github.com/rylos/rynas/releases/download/v${pkgver}/rynas-agent-x86_64")
source_aarch64=("rynas-agent-aarch64-${pkgver}::https://github.com/rylos/rynas/releases/download/v${pkgver}/rynas-agent-aarch64")
sha256sums=('60959dd72e5416461e666d9c27b27aaa935ad63f1f9b1fbff1f2afaf20151538')
sha256sums_x86_64=('01178f02fac98e83a96f282118568f4fc435e8fdfea9f4c4efcba580c091b876')
sha256sums_aarch64=('d491a66abd15030e8ce9cda4e2a05706a7e950e1c1cbd9375cf921b78f64576f')

package() {
  install -Dm755 "rynas-agent-${CARCH}-${pkgver}" "$pkgdir/usr/bin/rynas-agent"
  install -Dm644 rynas-agent.service "$pkgdir/usr/lib/systemd/system/rynas-agent.service"
}
