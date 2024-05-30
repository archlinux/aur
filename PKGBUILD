# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc64le-power8-glibc-bleeding-edge-toolchain
pkgver=2024.02
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2024.02-1.tar.bz2"
        "profile.sh-powerpc64le-power8-glibc-bleeding-edge-toolchain")
install="hooks.install-powerpc64le-power8-glibc-bleeding-edge-toolchain"
sha256sums=('f619d173a359c30ba71fa0a6bae26a71647b4f0d00d063564e0deeaeebd10c2b'
            'c2826338598bba25cd69b8224f37d39a3efe58b8553b166eea44b100d306aaf6')

build() {
	cd "powerpc64le-power8--glibc--bleeding-edge-2024.02-1"

	sh relocate-sdk.sh "/opt/powerpc64le-power8-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc64le-power8--glibc--bleeding-edge-2024.02-1"

	mkdir -p "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc64le-power8-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc64le-power8-glibc-bleeding-edge-toolchain.sh"
}
