# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=s390x-z13-musl-bleeding-edge-toolchain
pkgver=2024.05
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2024.05-1.tar.xz"
        "profile.sh-s390x-z13-musl-bleeding-edge-toolchain")
install="hooks.install-s390x-z13-musl-bleeding-edge-toolchain"
sha256sums=('9bbb6fc607a76c32964208ba2e2e0d09af4cd7f1d0b9511e524363e86147992d'
            '901b4dfdeb499338f9440a2e7e4379cce48de8feff5f0960b06d5b522876f17d')

build() {
	cd "s390x-z13--musl--bleeding-edge-2024.05-1"

	sh relocate-sdk.sh "/opt/s390x-z13-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "s390x-z13--musl--bleeding-edge-2024.05-1"

	mkdir -p "$pkgdir/opt/s390x-z13-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/s390x-z13-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/s390x-z13-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-s390x-z13-musl-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/s390x-z13-musl-bleeding-edge-toolchain.sh"
}
