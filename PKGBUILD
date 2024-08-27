# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64be-glibc-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-aarch64be-glibc-bleeding-edge-toolchain")
install="hooks.install-aarch64be-glibc-bleeding-edge-toolchain"
sha256sums=('02f588c6900d33286b89db5a92e60fdf611a47da5d05c1ee644ba14e2630ffca'
            '0902c283c2f25fe24bae25e284b0a9e4e31b0153839862ac8b0dc9bb2d59e55d')

build() {
	cd "aarch64be--glibc--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/aarch64be-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64be--glibc--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/aarch64be-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64be-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64be-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-aarch64be-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/aarch64be-glibc-bleeding-edge-toolchain.sh"
}
