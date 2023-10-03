# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=riscv64-lp64d-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-riscv64-lp64d-glibc-bleeding-edge-toolchain")
install="hooks.install-riscv64-lp64d-glibc-bleeding-edge-toolchain"
sha256sums=('9eda527aea5ce7da27957c3b8e4adb65430be046b713dca25432a09cb6675976'
            '67718a41eee75fe794f42ab58e9eb9f239a9278e2276577c650b2e474c7834ee')

build() {
	cd "riscv64-lp64d--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/riscv64-lp64d-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "riscv64-lp64d--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-riscv64-lp64d-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/riscv64-lp64d-glibc-bleeding-edge-toolchain.sh"
}
