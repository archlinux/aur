# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64-glibc-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-aarch64-glibc-bleeding-edge-toolchain")
install="hooks.install-aarch64-glibc-bleeding-edge-toolchain"
sha256sums=('4f64a9ecc2817db5a4cbf128fbd0162e9397cb2cf8316e005fc3fb3d16f097ae'
            'bfa2f36f7e21648e8a61eff59773af6f28af1aca0d4ec6e5882b200e444abf3a')

build() {
	cd "aarch64--glibc--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/aarch64-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64--glibc--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-aarch64-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/aarch64-glibc-bleeding-edge-toolchain.sh"
}
