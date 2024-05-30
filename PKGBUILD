# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv5-eabi-musl-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-armv5-eabi-musl-bleeding-edge-toolchain")
install="hooks.install-armv5-eabi-musl-bleeding-edge-toolchain"
sha256sums=('8dac4ea5697a42a88bd1d7d91c3d57a20a7db6239857def3d7518c8e2330b5a4'
            '4f46ed61713bc0435387da7b07bcfdc59e66c59d6050319515908f843d9702bc')

build() {
	cd "armv5-eabi--musl--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/armv5-eabi-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv5-eabi--musl--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv5-eabi-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv5-eabi-musl-bleeding-edge-toolchain.sh"
}
