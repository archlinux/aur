# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv5-eabi-musl-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-armv5-eabi-musl-bleeding-edge-toolchain")
install="hooks.install-armv5-eabi-musl-bleeding-edge-toolchain"
sha256sums=('5261ae65d4e454cb9d16a25a6f93f615742a10c64fb7ce08b7ce776c388abbdd'
            '4f46ed61713bc0435387da7b07bcfdc59e66c59d6050319515908f843d9702bc')

build() {
	cd "armv5-eabi--musl--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/armv5-eabi-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv5-eabi--musl--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/armv5-eabi-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv5-eabi-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv5-eabi-musl-bleeding-edge-toolchain.sh"
}
