# Maintainer: 

pkgname='refind-btrfs-snapshots-bin'
pkgver=0.2.1
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

sha256sums=('84cb402634172150c058086453d3e59b4c06d358915ebf95f519d963521819b1' 'fc411f49cb7c01cc187cab2af7bbd3325fced6e69a823779285ddfd2d8f997e0' '32bee81ce37ed6fe8aecb5fa11d4fe7c7a2004d1dd22ad6d5a8908c627ff13c1' '43e0c515d28e72a55a4afe9413174a3c8d14c600df93bff1df8102bed2ae0c5a')
sha256sums_x86_64=('93bd82847eb2192f2009bf21cb904d86cec47d1ca8d73562028b77dcf13c908a')
sha256sums_aarch64=('ffa2c2af4a30b1062fba892c597985606f000ecfd70e3334474a39344b3205d8')

package() {
    install -Dm755 "refind-btrfs-snapshots-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/refind-btrfs-snapshots"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.yaml" "${pkgdir}/etc/refind-btrfs-snapshots.yaml"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.service"
    install -Dm644 "refind-btrfs-snapshots-${pkgver}.path" "${pkgdir}/usr/lib/systemd/system/refind-btrfs-snapshots.path"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
