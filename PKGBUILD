# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libfftranscode
pkgver=0.6
pkgrel=1
pkgdesc="Proprietary library for ASN.1 APER <-> BER transcoding of RUA/RANAP/HNBAP/S1AP/NGAP"
arch=('x86_64')
url="http://ftp.osmocom.org/binaries/libfftranscode/"
license=('proprietary')
source=("http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}-dev_${pkgver}_amd64.deb"
        "http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}0_${pkgver}_amd64.deb")
sha256sums=('1a7fa4f7265861cfe012af01933dd824109a39f00372354109e547274dd7c1bf'
            'a53df3878bdb63731924cc8c9aad3f4d1b40887b8d0eaffde52154046ed70139')

exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}

package() {
	exz "${srcdir}/${pkgname}-dev_${pkgver}_amd64.deb"
	exz "${srcdir}/${pkgname}0_${pkgver}_amd64.deb"

	mkdir -p "${pkgdir}/usr/lib"
	cp "${srcdir}/usr/lib/x86_64-linux-gnu/libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/"
	ln -s "libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/libfftranscode.so.0"
	ln -s "libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/libfftranscode.so"

	mkdir -p "${pkgdir}/usr/lib/pkgconfig"
	cp "${srcdir}/usr/lib/x86_64-linux-gnu/pkgconfig/libfftranscode.pc" "${pkgdir}/usr/lib/pkgconfig/"
	sed -i "s#/lib/x86_64-linux-gnu#/lib#" "${pkgdir}/usr/lib/pkgconfig/libfftranscode.pc"

	mkdir -p "${pkgdir}/usr/include"
	cp -r "${srcdir}/usr/include/fftranscode/" "${pkgdir}/usr/include/"
}
