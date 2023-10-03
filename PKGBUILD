# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64be-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-aarch64be-musl-bleeding-edge-toolchain")
install="hooks.install-aarch64be-musl-bleeding-edge-toolchain"
sha256sums=('b2b30d563559664d0efc23eb00bc469c808bdfd400198967ba1255863301efc0'
            '942b6ff12b13c64748ce3d2b00829cc8649260b259c1efa06e4d6c6862a6661e')

build() {
	cd "aarch64be--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/aarch64be-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64be--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/aarch64be-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64be-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64be-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-aarch64be-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/aarch64be-musl-bleeding-edge-toolchain.sh"
}
