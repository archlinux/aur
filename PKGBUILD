# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc-440fp-musl-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-powerpc-440fp-musl-bleeding-edge-toolchain")
install="hooks.install-powerpc-440fp-musl-bleeding-edge-toolchain"
sha256sums=('49ae0f78dd343c5b40b2d732b58d34f1203e3e50f13b767d160c98efeda404f4'
            'fe521257bb4eef50fcdff57b8dd77f9bacf35e07f0740bd5cb9bb61c209e3522')

build() {
	cd "powerpc-440fp--musl--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/powerpc-440fp-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc-440fp--musl--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc-440fp-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc-440fp-musl-bleeding-edge-toolchain.sh"
}
