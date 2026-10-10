# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lowfat-bin
pkgver=0.9.0
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
sha256sums_x86_64=('b5a80de9a7b780829f7c8875ee83436655bdd7ce8077542c49dd6cac93a8fe2e')
sha256sums_aarch64=('44d259b76705f2f31c850bd885f7f05e267c3190c76cc2e7e5311ff437287651')

package() {
    # Each release tarball extracts to a single `lowfat` binary.
    install -Dm755 "${srcdir}/lowfat" "${pkgdir}/usr/bin/lowfat"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
