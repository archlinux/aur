# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc64-power8-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-powerpc64-power8-musl-bleeding-edge-toolchain")
install="hooks.install-powerpc64-power8-musl-bleeding-edge-toolchain"
sha256sums=('680c70daafe2f19a450d5a64694f758407abc71cfeaa385c7bb8af428ef0d11a'
            'f626cbe807237aa06d7eaa19db25359a6a6470bc4371d74b5fe1e7b131dfd6fd')

build() {
	cd "powerpc64-power8--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/powerpc64-power8-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc64-power8--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc64-power8-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc64-power8-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc64-power8-musl-bleeding-edge-toolchain.sh"
}
