# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc-440fp-musl-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-powerpc-440fp-musl-bleeding-edge-toolchain")
install="hooks.install-powerpc-440fp-musl-bleeding-edge-toolchain"
sha256sums=('5abd9ec89e402a9de7bdadd595d39de9181f0d351573751c8499aaef93c0d441'
            'fe521257bb4eef50fcdff57b8dd77f9bacf35e07f0740bd5cb9bb61c209e3522')

build() {
	cd "powerpc-440fp--musl--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/powerpc-440fp-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc-440fp--musl--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc-440fp-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc-440fp-musl-bleeding-edge-toolchain.sh"
}
