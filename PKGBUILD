# Maintainer: quantulr <quantulr at gmail dot com>

pkgname=rustfs-bin
pkgver=1.0.0_alpha.73
pkgrel=2
pkgdesc="🚀 High-performance distributed object storage for MinIO alternative."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/rustfs"
license=('Apache-2.0')
source=(
'rustfs.service'
'rustfs.env'
)
conflicts=('rustfs')
backup=("etc/default/rustfs")

source_x86_64=("rustfs-${pkgver//_/-}-x86_64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-x86_64-musl-v${pkgver//_/-}.zip")
source_aarch64=("rustfs-${pkgver//_/-}-aarch64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-aarch64-musl-v${pkgver//_/-}.zip")
sha256sums=('29aed584b39c63ca8054f9519848dcd47918e9c5272712745fef08b4058ad3d2'
            'e38071aeabc5e7d85e546e81545df89e9d2de01938c4764a701321f5bc30f356')
sha256sums_x86_64=('9c6b794748be8716b67cf60fb490f97305f371cd6d1937f146e05f1b2960e6f5')
sha256sums_aarch64=('9a729270b05a4558e8e3135c9d49cc01800fb2b2af66841e7eeb8a661983160c')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/data/rustfs0"
	mkdir -p "${pkgdir}/var/logs/rustfs"
	install -Dm644 "rustfs.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
