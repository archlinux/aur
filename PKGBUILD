# Maintainer: Harry Walker <me@harrywalker.uk>
pkgname=libfprint-ft9366
pkgver=1.94.4
pkgrel=1
pkgdesc="Proprietary driver for the Focaltech fingerprint reader 2808:a658, which is used on various ASUS Vivobooks"
arch=('x86_64')
url="https://github.com/ftfpteams/RTS5811-FT9366-fingerprint-linux-driver-with-VID-2808-and-PID-a658"
depends=('glib2>=2.56' 'libgusb>=0.3.0' 'nss>=3.13.4' 'pixman>=0.30.0')
conflicts=('libfprint')
provides=('libfprint-2.so' 'libfprint')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/ftfpteams/RTS5811-FT9366-fingerprint-linux-driver-with-VID-2808-and-PID-a658/raw/refs/heads/main/libfprint-2-2_1.94.4+tod1-0ubuntu1~22.04.2_amd64_rts5811.deb")
sha512sums=('9d8a98884ffe02c4871cac668e46038727a70fe0c0f4fbc9477a785612e6f0f567173eebaea83f78e9248a0a59a5ac5fef192546da997a6b43d6e1ba4dc90afb')

package(){

	# Extract package data
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	install -D -m644 "usr/share/doc/libfprint-2-2/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mv usr/lib/x86_64-linux-gnu/* usr/lib

	cd ..

}
