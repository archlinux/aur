# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc64le-power8-musl-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-powerpc64le-power8-musl-bleeding-edge-toolchain")
install="hooks.install-powerpc64le-power8-musl-bleeding-edge-toolchain"
sha256sums=('8506103888d0ee23a2e3126083e4f05ef18399c7adeb4e68838f864435394409'
            '7446e4e0ab4e1eebb1fd49e00479238352e5c61e1ade1f80d7c6ee70aef15f2b')

build() {
	cd "powerpc64le-power8--musl--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/powerpc64le-power8-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc64le-power8--musl--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/powerpc64le-power8-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc64le-power8-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc64le-power8-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc64le-power8-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc64le-power8-musl-bleeding-edge-toolchain.sh"
}
