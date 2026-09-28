# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>
# Contributor: Maciej <macrionyn@proton.me>

pkgname=disktui
pkgver=1.3.0
pkgrel=1
pkgdesc='A terminal-based disk management utility built with Rust and Ratatui'
url='https://github.com/mkbula/disktui'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'parted' 'e2fsprogs' 'cryptsetup' 'polkit' 'which')
optdepends=(
	'dosfstools: FAT32 filesystem support'
	'ntfsprogs: NTFS filesystem support'
	'exfatprogs: exFAT filesystem support'
	'btrfs-progs: Btrfs filesystem support'
	'xfsprogs: XFS filesystem support'
	'smartmontools: SMART disk health monitoring'
)

_tag=v${pkgver}

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('5f64fa0d6608de784564b5c99237d3537d006add06c7fd78625f7d6bdb8f25f597818d576f0f0712419cbfd640b5a7d8eb05f5d8f9eb91561cf09c916564ac0b')

build() {
	cd ${pkgname}-${pkgver}

	cargo build --release --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 target/release/disktui -t "${pkgdir}/usr/bin"
	install -Dm 755 target/release/disktui-helper -t "${pkgdir}/usr/bin"

	install -Dm 644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}"
}
