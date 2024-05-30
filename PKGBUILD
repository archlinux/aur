# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv7-eabihf-glibc-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-armv7-eabihf-glibc-bleeding-edge-toolchain")
install="hooks.install-armv7-eabihf-glibc-bleeding-edge-toolchain"
sha256sums=('db5178feac8a02f3dc6fab16448d0ca2835bc915ca0453f6aba6510b7dccfb5d'
            'eda70b43164ec141b46e1b4863652047136be9f12cb7a2690ccb0fc7b73ceb63')

build() {
	cd "armv7-eabihf--glibc--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/armv7-eabihf-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv7-eabihf--glibc--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv7-eabihf-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv7-eabihf-glibc-bleeding-edge-toolchain.sh"
}
