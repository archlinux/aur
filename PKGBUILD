# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=libstdc++5-bin
_pkgname=libstdc++5
pkgver=3.3.6
pkgrel=32
pkgdesc="The GNU Standard C++ Library v3."
arch=('x86_64')
url="https://packages.debian.org/bullseye/libstdc++5"
license=('GPL')
depends=('gcc>=3.3.4' 'glibc>=2.14')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("libstdc++5_3.3.6-32_amd64.deb::http://ftp.de.debian.org/debian/pool/main/g/gcc-3.3/libstdc++5_3.3.6-32_amd64.deb")
sha256sums=('5d720d22b4c9f92c6fa48a3b3531a61d54ea1212f25553b16cd2d7a30a4b2a66')
package() {
	# Extract package data
        cd ${srcdir}
        tar xf data.tar.xz -C "${pkgdir}"

	# Install binary files
	mv "${pkgdir}/usr/lib/x86_64-linux-gnu/libstdc++.so.5.0.7" "${pkgdir}"/usr/lib
    	ln -s libstdc++.so.5.0.7 "${pkgdir}/usr/lib/libstdc++.so.5"
	rm -rf "${pkgdir}/usr/lib/x86_64-linux-gnu"

	# Install license file	
 	install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

        # Fix permissions
        chown root:root -R "${pkgdir}"
        chmod -R go-w "${pkgdir}"
	chmod 755 "${pkgdir}/usr/lib/libstdc++.so.5.0.7"
}
