# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64-musl-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-aarch64-musl-bleeding-edge-toolchain")
install="hooks.install-aarch64-musl-bleeding-edge-toolchain"
sha256sums=('f63c27eabff2b3e733ad132866a5301d90a9068f2b83ff5d36e907bd958951dc'
            '609ced72adb702b143062cadb316151e6647e71526a8c42a18c013d40bb9f13c')

build() {
	cd "aarch64--musl--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/aarch64-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64--musl--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/aarch64-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-aarch64-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/aarch64-musl-bleeding-edge-toolchain.sh"
}
