# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=riscv64-lp64d-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1.1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-riscv64-lp64d-musl-bleeding-edge-toolchain")
install="hooks.install-riscv64-lp64d-musl-bleeding-edge-toolchain"
sha256sums=('3687ddfbc6d4008e6b5fa2533a6e651d6db7281014917de8d2200b320f440633'
            '40b88111144cf9d3db70be65a3ef1f8e4812d93ff7f68a42492a26fe1e234119')

build() {
	cd "riscv64-lp64d--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/riscv64-lp64d-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "riscv64-lp64d--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/riscv64-lp64d-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/riscv64-lp64d-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/riscv64-lp64d-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-riscv64-lp64d-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/riscv64-lp64d-musl-bleeding-edge-toolchain.sh"
}
