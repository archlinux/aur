# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv7-eabihf-musl-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-armv7-eabihf-musl-bleeding-edge-toolchain")
install="hooks.install-armv7-eabihf-musl-bleeding-edge-toolchain"
sha256sums=('fcc4421b04ede8996d350a3517890c48ba200a9102787ddd288f2c5037b3de4c'
            '43ff31a90e056fa5714640b59348e2b08427cdc481695edf4d4f0c0a496a6ff5')

build() {
	cd "armv7-eabihf--musl--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/armv7-eabihf-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv7-eabihf--musl--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/armv7-eabihf-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv7-eabihf-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv7-eabihf-musl-bleeding-edge-toolchain.sh"
}
