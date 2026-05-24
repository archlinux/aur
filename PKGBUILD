# Maintainer: 

pkgname='refind-btrfs-snapshots-bin'
pkgver=0.0.10
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
    "refind-btrfs-snapshots.yaml::https://raw.githubusercontent.com/jmylchreest/refind-btrfs-snapshots/v${pkgver}/configs/refind-btrfs-snapshots.yaml"
    "refind-btrfs-snapshots.service::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots.service"
    "refind-btrfs-snapshots.path::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots.path"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jmylchreest/refind-btrfs-snapshots/v${pkgver}/LICENSE"
)

# Architecture-specific binary sources
source_x86_64=(
    "refind-btrfs-snapshots-${pkgver}-x86_64::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots-linux-amd64"
)
source_aarch64=(
    "refind-btrfs-snapshots-${pkgver}-aarch64::${_github_url}/releases/download/v${pkgver}/refind-btrfs-snapshots-linux-arm64"
)

sha256sums=('435749faf34afb43ba1f6d9f32702a82b9ff25c7674bf331d9b1be7ffe6ff1bc' '3b683ead4b7361f252a2c4b5b85a6feb1b3b6a43d5c5edae60aefb6fa99ddb2e' '0c178df74ed47e4c12024ca0e6de5c5220c4134c68121ecd5be6a1d67b7bf550' '43e0c515d28e72a55a4afe9413174a3c8d14c600df93bff1df8102bed2ae0c5a')
sha256sums_x86_64=('22d641fd326af4787ac4b003e072a98ed3671bcfb22e82b4f16d97f897359681')
sha256sums_aarch64=('e06a37a0c4b9aa78faa2710eadda62ba90ac4d223bff77428123fe22e9633520')

package() {
    install -Dm755 "refind-btrfs-snapshots-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/refind-btrfs-snapshots"
    install -Dm644 "refind-btrfs-snapshots.yaml" "${pkgdir}/etc/refind-btrfs-snapshots.yaml"
    install -Dm644 "refind-btrfs-snapshots.service" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.service"
    install -Dm644 "refind-btrfs-snapshots.path" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.path"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
