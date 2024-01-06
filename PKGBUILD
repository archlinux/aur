# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=mips32el-glibc-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-mips32el-glibc-bleeding-edge-toolchain")
install="hooks.install-mips32el-glibc-bleeding-edge-toolchain"
sha256sums=('90afdb045301503974a7337822645c975766b1749472a4b98de8251737e97434'
            '80373fb6b96f0549b719393c9538dd6549dc0adaeac2c7b7582dcec02c9ffbe4')

build() {
	cd "mips32el--glibc--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/mips32el-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "mips32el--glibc--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/mips32el-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/mips32el-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/mips32el-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-mips32el-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/mips32el-glibc-bleeding-edge-toolchain.sh"
}
