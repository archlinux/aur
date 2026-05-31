# Maintainer: quantulr <quantulr at gmail dot com>

pkgname=rustfs-bin
pkgver=1.0.0_beta.6
pkgrel=1
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
sha256sums=('9e05f7cf55881318759f3850b6a9202fd8f89cb589f9973598ea1377836b4303'
            'a8fbeca6f2bd3a54cba5c029804a6df8ccbaaadfc51e758266b7385db7b74eb5')
sha256sums_x86_64=('e2dfa35259a65f3635f754af8414e79486d5b1134ddf901252a7a9444ba7b4cc')
sha256sums_aarch64=('67134f0193034e5246fce7ceb7130ce2f594e25f4b80c69140f7266c764c3e8b')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/data/rustfs0"
	mkdir -p "${pkgdir}/var/logs/rustfs"
	install -Dm644 "rustfs.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
