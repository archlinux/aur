# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=mips32el-musl-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-mips32el-musl-bleeding-edge-toolchain")
install="hooks.install-mips32el-musl-bleeding-edge-toolchain"
sha256sums=('b22b3eb247529eb320f2d5d1cec0b903c2509ef11b16ca77715f62bba0d687b0'
            'b1be15136b35ace1fdc7712628e3b2e89470fc04b5897f971c2ca6fcd6405e50')

build() {
	cd "mips32el--musl--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/mips32el-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "mips32el--musl--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/mips32el-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-mips32el-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/mips32el-musl-bleeding-edge-toolchain.sh"
}
