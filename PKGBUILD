# Maintainer: 

pkgname='refind-btrfs-snapshots-bin'
pkgver=0.1.1
pkgrel=1
pkgdesc='Generate rEFInd boot entries for btrfs snapshots (prebuilt binaries)'
url='https://github.com/jmylchreest/refind-btrfs-snapshots'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
depends=('btrfs-progs' 'util-linux')
provides=('refind-btrfs-snapshots')
conflicts=('refind-btrfs-snapshots')
backup=('etc/refind-btrfs-snapshots.yaml')

_github_url="https://github.com/jmylchreest/refind-btrfs-snapshots"

# Common sources (config, systemd units, license)
source=(
    "refind-btrfs-snapshots-${pkgver}.yaml::https://raw.githubusercontent.com/jmylchreest/refind-btrfs-snapshots/v${pkgver}/configs/refind-btrfs-snapshots.yaml"
    "refind-btrfs-snapshots-${pkgver}.service::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots.service"
    "refind-btrfs-snapshots-${pkgver}.path::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots.path"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jmylchreest/refind-btrfs-snapshots/v${pkgver}/LICENSE"
)

# Architecture-specific binary sources
source_x86_64=(
    "refind-btrfs-snapshots-${pkgver}-x86_64::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots-linux-amd64"
)
source_aarch64=(
    "refind-btrfs-snapshots-${pkgver}-aarch64::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots-linux-arm64"
)

sha256sums=('ab19320086923485a2c4622c8530105e759ca63a2915d42a38882e4398d4f5f9' 'fc411f49cb7c01cc187cab2af7bbd3325fced6e69a823779285ddfd2d8f997e0' '32bee81ce37ed6fe8aecb5fa11d4fe7c7a2004d1dd22ad6d5a8908c627ff13c1' '43e0c515d28e72a55a4afe9413174a3c8d14c600df93bff1df8102bed2ae0c5a')
sha256sums_x86_64=('c7d65f6d4783cdb295ef08e27b6b35acb5e6e9445509f88bdd62e1aca0c98c68')
sha256sums_aarch64=('3c3136e0258ad67896c883bc9e7276f77e680ffdc200fc995668a0f311c1c88f')

package() {
    install -Dm755 "refind-btrfs-snapshots-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/refind-btrfs-snapshots"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.yaml" "${pkgdir}/etc/refind-btrfs-snapshots.yaml"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.service"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.path" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.path"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
