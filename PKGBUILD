# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>

pkgname=rustfs-bin
pkgver=1.0.1
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
sha256sums=('4a5c680acc023be08fd81b034a6febc13fb05bb1dc54c669984a61298d61ba49'
            'f1675ef352c03c65e76ab7ddeea53b50081d48ec7302ee99700b0de54c49635d'
            '981bebef4a2e535766f9385e508d8f241c694fe14ee1ee1a397c71d016c25c55'
            '0452538248feb539433c44894d631309cc708749fa6047ce2b1968632b9df741')
sha256sums_x86_64=('a834096dafa1f1a55825a2cdaf49d006a193978d344f2d508c2be475133738a3')
sha256sums_aarch64=('d2533e293204597416cb8d30790ea35df14cb4521633fa3574c64333141bafdf')

package() {
	cd "${srcdir}"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/rustfs.conf"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/rustfs.conf"
	install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
