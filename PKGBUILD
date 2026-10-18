# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>

pkgname=rustfs-bin
pkgver=1.0.3
pkgrel=2
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
            '124262e1e75d7ed0d6e2eda762a809a3c75ed43a771c84302e61ace0eacb5adb'
            '981bebef4a2e535766f9385e508d8f241c694fe14ee1ee1a397c71d016c25c55'
            '7134c0135d5a68aeb6e6d3491c2db7141163f219acf7430bdd99014280f7eb66')
sha256sums_x86_64=('29a083f156fe1a246f0336afe16ff77fffe587628e97339448d8f4fba38dba54')
sha256sums_aarch64=('28e973c6e630dfa1c7a6d7af86b360e598a34c476d34a0dcbcfbeb70b1f06747')

package() {
	cd "${srcdir}"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/rustfs.conf"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/rustfs.conf"
	install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/system/rustfs.service"
	install -Dm644 "rustfs.env" "${pkgdir}/etc/default/rustfs"
	install -Dm755 "rustfs" "${pkgdir}/usr/bin/rustfs"
}
