# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=s390x-z13-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1.1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2023.08-1.tar.bz2"
        "profile.sh-s390x-z13-glibc-bleeding-edge-toolchain")
install="hooks.install-s390x-z13-glibc-bleeding-edge-toolchain"
sha256sums=('38edb78e044ce8c47214452084d5ce38c8b94a2484b296972a764da701ca738a'
            '9378a32f3f599f207695ce96451c7c0a96c7dd63be120d4f21cd0520670d9272')

build() {
	cd "s390x-z13--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/s390x-z13-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "s390x-z13--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"

	mkdir -p "$pkgdir/etc/profile.d/"
	install -m0644 "$srcdir/profile.sh-s390x-z13-glibc-bleeding-edge-toolchain" "$pkgdir/etc/profile.d/s390x-z13-glibc-bleeding-edge-toolchain.sh"
}
