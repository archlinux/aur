# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc-440fp-glibc-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-powerpc-440fp-glibc-bleeding-edge-toolchain")
install="hooks.install-powerpc-440fp-glibc-bleeding-edge-toolchain"
sha256sums=('9e5601beacf2b4d96f7ed12851c722b8f83beaa9da8f7ae7734816fca2d4da1e'
            '2bde8863f1740108e851676867eeab92b5c3014f76591b8d21b59760f0a9f7e0')

build() {
	cd "powerpc-440fp--glibc--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/powerpc-440fp-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc-440fp--glibc--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc-440fp-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc-440fp-glibc-bleeding-edge-toolchain.sh"
}
