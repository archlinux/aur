# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>

pkgname=rustfs-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="🚀 High-performance distributed object storage for MinIO alternative."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/rustfs"
license=('Apache-2.0')
source=(
	'systemd.service'
	'rustfs.env'
	'sysusers.conf'
	'tmpfiles.conf'
)
conflicts=('rustfs')
backup=("etc/default/rustfs")
options=('!strip' '!debug')

source_x86_64=("rustfs-${pkgver//_/-}-x86_64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-x86_64-musl-v${pkgver//_/-}.zip")
source_aarch64=("rustfs-${pkgver//_/-}-aarch64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-aarch64-musl-v${pkgver//_/-}.zip")
sha256sums=('5c83598a815b65c882c4152f8f0920a463dcbcced40b7480f8ef1507c4cf5da6'
            'ca1d01a8b6d3fa5c280e911ed3299bb23df122ce18965dacf4d20c5ce1b178d2'
            '981bebef4a2e535766f9385e508d8f241c694fe14ee1ee1a397c71d016c25c55'
            '21ccdb6a75d863265a213b34468d1a4d4d2f57536d1822612ed3220a3ab00573')
sha256sums_x86_64=('3d9d42bb4cb7a1589266090d4f9f8238465506cdd9d5e897193377dd6f610aac')
sha256sums_aarch64=('082834d38167f2fa581e98d14a7126e3e203153e38ae5882eca8d02a4207d12f')

package() {
	cd "${srcdir}"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/rustfs.conf"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/rustfs.conf"
	install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
