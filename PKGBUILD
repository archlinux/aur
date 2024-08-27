# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=riscv64-lp64d-glibc-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-riscv64-lp64d-glibc-bleeding-edge-toolchain")
install="hooks.install-riscv64-lp64d-glibc-bleeding-edge-toolchain"
sha256sums=('a9e41a646d6757e47ab0539171bef54a6c0bf68f191210500875b386ea15444c'
            '67718a41eee75fe794f42ab58e9eb9f239a9278e2276577c650b2e474c7834ee')

build() {
	cd "riscv64-lp64d--glibc--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/riscv64-lp64d-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "riscv64-lp64d--glibc--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/riscv64-lp64d-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-riscv64-lp64d-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/riscv64-lp64d-glibc-bleeding-edge-toolchain.sh"
}
