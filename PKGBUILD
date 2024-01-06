# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv5-eabi-glibc-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-armv5-eabi-glibc-bleeding-edge-toolchain")
install="hooks.install-armv5-eabi-glibc-bleeding-edge-toolchain"
sha256sums=('80b67f939e5cbd1d2fa13fe063fd5d8aca1f5a702adf010547d8904864fe2209'
            '0393a397690b72ed670dcd34aa3fd2b5f85f2edac4dd08b7837377b7ff8110ef')

build() {
	cd "armv5-eabi--glibc--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/armv5-eabi-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv5-eabi--glibc--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv5-eabi-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv5-eabi-glibc-bleeding-edge-toolchain.sh"
}
