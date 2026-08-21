# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>

pkgname=rustfs-bin
pkgver=1.0.0_rc.3
pkgrel=1
pkgdesc="🚀 High-performance distributed object storage for MinIO alternative."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/rustfs"
license=('Apache-2.0')
source=(
	'rustfs.service'
	'rustfs.env'
	'rustfs.tmpfiles'
)
conflicts=('rustfs')
backup=("etc/default/rustfs")
options=('!strip' '!debug')

source_x86_64=("rustfs-${pkgver//_/-}-x86_64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-x86_64-musl-v${pkgver//_/-}.zip")
source_aarch64=("rustfs-${pkgver//_/-}-aarch64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-aarch64-musl-v${pkgver//_/-}.zip")
sha256sums=('64e522c6dadbae219cb87d595670cbdd02e7c3d5264fff136ab273ced276d5f2'
            '5615bf4ceef11365fd318ad881298c76ccaa87ae0c7a4e4b85d01ba28876adb5'
            '8f276c817ad6a6313b6b896241f9e4018c01ae51b661a7cee903a1e779835268')
sha256sums_x86_64=('397a0aaa4d7d1c1a6ec34681e394837168a9a8cda5fc8c17faf5657cc552110a')
sha256sums_aarch64=('238318d5e3a56fab6376ac9f32cb563534d504e7eab351cf8b4de878008e0881')

package() {
	cd "${srcdir}"
	install -Dm644 "rustfs.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/rustfs.conf"
	install -Dm644 "rustfs.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
