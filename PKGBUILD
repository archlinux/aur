# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lowfat-bin
pkgver=0.7.2
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
sha256sums=('SKIP')
sha256sums_x86_64=('7fe8c823399963dc98ec7a7288fda8fcb6a9a91111f75a738311c192dbfe7485')
sha256sums_aarch64=('a1dd9f888a26f20562de130fe16c8582a0819a67519b9f472fb8edacc1d0092a')

package() {
    # Each release tarball extracts to a single `lowfat` binary.
    install -Dm755 "${srcdir}/lowfat" "${pkgdir}/usr/bin/lowfat"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
