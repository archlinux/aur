# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64-glibc-bleeding-edge-toolchain
pkgver=2023.11
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2023.11-1.tar.bz2"
        "profile.sh-aarch64-glibc-bleeding-edge-toolchain")
install="hooks.install-aarch64-glibc-bleeding-edge-toolchain"
sha256sums=('9d4c3a45e5f781060b81779ba116b2118805f214c3b1042ce8ecde5c4aeb12c3'
            'bfa2f36f7e21648e8a61eff59773af6f28af1aca0d4ec6e5882b200e444abf3a')

build() {
	cd "aarch64--glibc--bleeding-edge-2023.11-1"

	sh relocate-sdk.sh "/opt/aarch64-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64--glibc--bleeding-edge-2023.11-1"

	mkdir -p "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-aarch64-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/aarch64-glibc-bleeding-edge-toolchain.sh"
}
