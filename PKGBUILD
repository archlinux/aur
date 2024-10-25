# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=micron-storage-executive-cli
pkgver=10.01.012024.00
pkgrel=1
pkgdesc="Micron Storage Executive Command Line (msecli) for configuring and managing Micron SSDs"
arch=(x86_64)
url="https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli"
license=()
makedepends=('bitrock-unpacker')
optdepends=()
source=(https://www.micron.com/content/dam/micron/global/public/products/software/storage-executive-software/msecli/msecli-linux.run)
md5sums=('56296e2c2400c4e5f2849f594d5e3690')
sha1sums=('9336123d36fde94019fb83d65af2a307e3208266')

package() {
	mkdir -p "${srcdir}/unpacked"
	bitrock-unpacker "${srcdir}/msecli-linux.run" "${srcdir}/unpacked"
	cd "${srcdir}/unpacked/default"
	install -Dm644 -t "${pkgdir}/usr/lib/" "linux_x64/libstorelib.so"
	install -Dm755 -t "${pkgdir}/usr/bin/" "linux_x64/msecli"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "common_files/"*.pdf
	#"${srcdir}/msecli-linux.run" --unattendedmodeui none --mode unattended --prefix "${pkgdir}"
}
