# Maintainer: Marco Ziliani (rylos)
# AUR: rynas-agent-bin (the static binary of the GitHub release). Copy to PKGBUILD in the AUR
# repository; `pkgver` and the checksums follow each release.
pkgname=rynas-agent-bin
pkgver=0.8.24
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
sha256sums=('b2295cea98b5cdcc102774007fc369496991d7df1b20d1d57fa0ee2ea99ce902')
sha256sums_x86_64=('418af364a52fa30945c2439a3df5ab106fdf791e137c784a4158f5824fdaa79b')
sha256sums_aarch64=('57fe52227198608f497adab4a682346a73424257d4c41679b42a0601e3fe6c17')

package() {
  install -Dm755 "rynas-agent-${CARCH}-${pkgver}" "$pkgdir/usr/bin/rynas-agent"
  install -Dm644 rynas-agent.service "$pkgdir/usr/lib/systemd/system/rynas-agent.service"
}
