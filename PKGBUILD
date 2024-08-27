# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=mips32el-musl-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-mips32el-musl-bleeding-edge-toolchain")
install="hooks.install-mips32el-musl-bleeding-edge-toolchain"
sha256sums=('bceda5815e975ff09530e5ba18d673ce4eccbfe42a2bb23c10dfd1a0ab54deb8'
            'b1be15136b35ace1fdc7712628e3b2e89470fc04b5897f971c2ca6fcd6405e50')

build() {
	cd "mips32el--musl--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/mips32el-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "mips32el--musl--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/mips32el-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-mips32el-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/mips32el-musl-bleeding-edge-toolchain.sh"
}
