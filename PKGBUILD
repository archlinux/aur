# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc64le-power8-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1.1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-powerpc64le-power8-glibc-bleeding-edge-toolchain")
install="hooks.install-powerpc64le-power8-glibc-bleeding-edge-toolchain"
sha256sums=('6b0f83a79375774eeff1c67de6b22610833be9f4ef75535368f2c6d1e14ec4ca'
            'c2826338598bba25cd69b8224f37d39a3efe58b8553b166eea44b100d306aaf6')

build() {
	cd "powerpc64le-power8--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/powerpc64le-power8-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc64le-power8--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc64le-power8-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-powerpc64le-power8-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/powerpc64le-power8-glibc-bleeding-edge-toolchain.sh"
}
