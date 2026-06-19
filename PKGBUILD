# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lowfat-bin
pkgver=0.8.0
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
sha256sums_x86_64=('dccc2cfabe341873a7d8ca11cc6a250bb304792ff31773c86e4a58cbc01be36e')
sha256sums_aarch64=('64465a52361c4f420217fd9892fa8576f4d1425ceb6a0530d3e55cfbb9ad3991')

package() {
    # Each release tarball extracts to a single `lowfat` binary.
    install -Dm755 "${srcdir}/lowfat" "${pkgdir}/usr/bin/lowfat"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
