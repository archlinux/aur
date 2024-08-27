# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv7-eabihf-musl-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-armv7-eabihf-musl-bleeding-edge-toolchain")
install="hooks.install-armv7-eabihf-musl-bleeding-edge-toolchain"
sha256sums=('2a8274d28abd4779010dda6b54bfe0d259559181f99908440d39974f2619567a'
            '43ff31a90e056fa5714640b59348e2b08427cdc481695edf4d4f0c0a496a6ff5')

build() {
	cd "armv7-eabihf--musl--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/armv7-eabihf-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv7-eabihf--musl--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv7-eabihf-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv7-eabihf-musl-bleeding-edge-toolchain.sh"
}
