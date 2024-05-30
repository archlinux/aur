# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc64-power8-musl-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-powerpc64-power8-musl-bleeding-edge-toolchain")
install="hooks.install-powerpc64-power8-musl-bleeding-edge-toolchain"
sha256sums=('405c7d69aa6538aac7020f53dc414b4dfadd48e95a670e5dd3e70e33402e0a4f'
            'f626cbe807237aa06d7eaa19db25359a6a6470bc4371d74b5fe1e7b131dfd6fd')

build() {
	cd "powerpc64-power8--musl--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/powerpc64-power8-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc64-power8--musl--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc64-power8-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc64-power8-musl-bleeding-edge-toolchain.sh"
}
