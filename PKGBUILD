# Maintainer: Mykola Odnosumov <modnosum@gmail.com>

pkgname=ftplib
pkgver=4.0
pkgrel=1
epoch=1
pkgdesc="ftplib is a set of routines that implement the FTP protocol. They allow applications to create and access remote files through function calls instead of needing to fork and exec an interactive ftp client program."
arch=('any')
url="https://nbpfaus.net/~pfau/ftplib/"
license=('Artistic2.0')
source=("http://nbpfaus.net/~pfau/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('9b1e8e2aee2f0798c8399378dd6c2f5e9138017259aa18f18070cdf76b191d8e')

build() {
	cd "${pkgname}-${pkgver}-${pkgrel}/src"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/local/lib"
	mkdir -p "${pkgdir}/usr/local/include"

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/src"

	install -m 755 qftp "${pkgdir}/usr/local/bin"
	install -m 644 "libftp.so.${pkgver}" "${pkgdir}/usr/local/lib"
	install -m 644 ftplib.h "${pkgdir}/usr/local/include"

	cd "${pkgdir}/usr/local/lib"
	ln -s "libftp.so.${pkgver}" libftp.so

	cd "${pkgdir}/usr/local/bin"
	for ftp_bin in ftpdir ftpget ftplist ftprm ftpsend;
	  do ln -s qftp ${ftp_bin}
	done
}
