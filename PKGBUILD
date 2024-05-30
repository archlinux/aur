# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv5-eabi-glibc-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-armv5-eabi-glibc-bleeding-edge-toolchain")
install="hooks.install-armv5-eabi-glibc-bleeding-edge-toolchain"
sha256sums=('8f6c0bd14479ced3814917a12cc8c0809fa5161c87da39b362a1ec8bc348e95c'
            '0393a397690b72ed670dcd34aa3fd2b5f85f2edac4dd08b7837377b7ff8110ef')

build() {
	cd "armv5-eabi--glibc--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/armv5-eabi-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv5-eabi--glibc--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv5-eabi-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv5-eabi-glibc-bleeding-edge-toolchain.sh"
}
