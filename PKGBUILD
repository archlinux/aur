# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv7-eabihf-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1.1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-armv7-eabihf-glibc-bleeding-edge-toolchain")
install="hooks.install-armv7-eabihf-glibc-bleeding-edge-toolchain"
sha256sums=('fe0b14d6c92ab939d47dcff1f39552aa299d9bbdf0a4571428c56daf69246e70'
            'eda70b43164ec141b46e1b4863652047136be9f12cb7a2690ccb0fc7b73ceb63')

build() {
	cd "armv7-eabihf--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/armv7-eabihf-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv7-eabihf--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/armv7-eabihf-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-armv7-eabihf-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/armv7-eabihf-glibc-bleeding-edge-toolchain.sh"
}
