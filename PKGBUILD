# Maintainer: Marco Ziliani (rylos)
# AUR: rynas-agent-bin (the static binary of the GitHub release). Copy to PKGBUILD in the AUR
# repository; `pkgver` and the checksums follow each release.
pkgname=rynas-agent-bin
pkgver=0.8.28
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
sha256sums_x86_64=('8090b89dce7180559aa4497acb365496e8ec11b7a23bb76298c53485d60c168b')
sha256sums_aarch64=('bd8abd108cb2978c16752110ac3ea5b1886ad05d4d7af34436684da375a5fdef')

package() {
  install -Dm755 "rynas-agent-${CARCH}-${pkgver}" "$pkgdir/usr/bin/rynas-agent"
  install -Dm644 rynas-agent.service "$pkgdir/usr/lib/systemd/system/rynas-agent.service"
}
