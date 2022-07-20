# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-bin
pkgver=0.14.2
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
sha512sums=('fca3432f04666c1c26277a395bbe9fb84ae3033f74df1f0e5f7e5e63245d75f7290ff674a9ea698be1789e1bc5c24a928701375890d2f38a66ba05eee36fe1ec')

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
