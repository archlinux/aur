# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS or BTRFS snapshots. (binary .deb)"
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
groups=('utility')
provides=('httm')
conflicts=('httm')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/httm_${pkgver}_amd64.deb")
sha512sums=('65ceb32d011d1a07c4e29fe58132bf3a4efe8c2a9b9c28190760045e214aebca3ca916b6cddd00967c0aac781267922bf968f96bb0167bbbcce40d985d1285b3')

prepare() {
	tar -xf data.tar.xz
	gzip -df usr/share/man/man1/httm.1.gz
}

package(){
	_name=${pkgname//[-bin]/}

	# install executable
	install -Dm755 "${srcdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}"

	# install man page
	install -Dm644 "${srcdir}/usr/share/man/man1/${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"

	# install README.md
	install -Dm644 "${srcdir}/usr/share/doc/${_name}/README" "${pkgdir}/usr/share/doc/${_name}/README"

	# install LICENSE
	install -Dm644 "${srcdir}/usr/share/doc/httm/copyright" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
