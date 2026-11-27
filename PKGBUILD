# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>

pkgname=rustfs-bin
pkgver=1.0.7
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
	"README.md::https://raw.githubusercontent.com/rustfs/rustfs/${pkgver//_/-}/README.md"
	"LICENSE::https://raw.githubusercontent.com/rustfs/rustfs/${pkgver//_/-}/LICENSE"
)
conflicts=('rustfs')
backup=("etc/default/rustfs")
options=('!strip' '!debug')

source_x86_64=("rustfs-${pkgver//_/-}-x86_64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-x86_64-musl-v${pkgver//_/-}.zip")
source_aarch64=("rustfs-${pkgver//_/-}-aarch64.zip::https://github.com/rustfs/rustfs/releases/download/${pkgver//_/-}/rustfs-linux-aarch64-musl-v${pkgver//_/-}.zip")
sha256sums=('5c83598a815b65c882c4152f8f0920a463dcbcced40b7480f8ef1507c4cf5da6'
            'ca1d01a8b6d3fa5c280e911ed3299bb23df122ce18965dacf4d20c5ce1b178d2'
            '981bebef4a2e535766f9385e508d8f241c694fe14ee1ee1a397c71d016c25c55'
            '21ccdb6a75d863265a213b34468d1a4d4d2f57536d1822612ed3220a3ab00573'
            '86c3104b47e4ef7c2059a3684e2687d2a108c936249d5d2dc177f3598634ea2c'
            '8ef87773cd6df917c9cf75bdb3075d92b78ad4cdf8e51d6c98030292442524d8')
sha256sums_x86_64=('c90a40ba8cdc1468c71029a4d65fdd13449720183d3a8e00bc61ab09fcd448a5')
sha256sums_aarch64=('e2c6d45105dd05df2f35547fbebfacf40dfba6ec4f8c31b86e30934faea79e76')

package() {
	cd "${srcdir}"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/rustfs.conf"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/rustfs.conf"
	install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/rustfs/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/rustfs/LICENSE"
}
