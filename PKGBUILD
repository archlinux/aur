# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lowfat-bin
pkgver=0.6.10
pkgrel=1
pkgdesc="Lightweight CLI that filters verbose command output to cut AI agent token costs"
arch=('x86_64' 'aarch64')
url="https://github.com/zdk/lowfat"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("lowfat=${pkgver}")
conflicts=('lowfat')
# Let makepkg strip the upstream binary (plain Rust ELF, safe to strip),
# but skip the debug subpackage: upstream's release build carries no DWARF,
# so the split-out package would hold only an empty /usr/src/debug tree and
# a dangling build-id symlink.
options=('!debug')

_relurl="https://github.com/zdk/lowfat/releases/download/v${pkgver}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/zdk/lowfat/v${pkgver}/LICENSE")
source_x86_64=("lowfat-${pkgver}-x86_64.tar.gz::${_relurl}/lowfat-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lowfat-${pkgver}-aarch64.tar.gz::${_relurl}/lowfat-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('b727674547d95907efffa3e2ca07531331e23cd6fb1cc5f9f8112ab1e129f1a1')
sha256sums_x86_64=('a4bab110f270af9b91249e1b30db9c339c4ddfbfcbff9a6c5bf4f6dc3b64b1b7')
sha256sums_aarch64=('4a933eaa80421a51308f5d975f02d28d767a313476de2e681e2593ec90cd3cdb')

package() {
    # Each release tarball extracts to a single `lowfat` binary.
    install -Dm755 "${srcdir}/lowfat" "${pkgdir}/usr/bin/lowfat"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
