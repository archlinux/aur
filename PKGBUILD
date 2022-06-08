# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS or BTRFS snapshots. (binary .deb)"
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
groups=('utility')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/httm_${pkgver}_amd64.deb")
sha512sums=('7ecafcd2152ea583485b4a1816de2cfbd756e6fd5f802f3bcd981386d8a444a5e505d0ea4a44325d0387840844dfaa39821d50fd1c60ad34fb13cfd2e139eeec')

prepare() {
	tar -xf data.tar.xz
	gzip -d usr/share/man/man1/httm.1.gz
}

package(){
	# install executable
	install -Dm755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# install man page
	install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	# install README.md
	install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"

	# install LICENSE
	install -Dm644 "${srcdir}/usr/share/doc/httm/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
