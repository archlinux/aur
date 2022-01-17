# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>
pkgname=libfftranscode
pkgver=0.2
pkgrel=1
pkgdesc="Proprietary library for ASN.1 APER <-> BER transcoding of RUA/RANAP/HNBAP/S1AP"
arch=('x86_64')
url="http://ftp.osmocom.org/binaries/libfftranscode/"
license=('proprietary')
groups=('devel')
source=("http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}-dev_${pkgver}_amd64.deb"
        "http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}0_${pkgver}_amd64.deb"
	"libfftranscode.pc")
md5sums=("7085e78c8ed7f4f2221f663ffbcc8972"
         "cb7f85fa04aeefd9b9576e463354449c"
         "8bec20223f254ba236f3821ceca718b9")

package() {
	ar x "${srcdir}/${pkgname}-dev_${pkgver}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/${pkgname}0_${pkgver}_amd64.deb"
	tar xJf data.tar.xz

	mkdir -p "${pkgdir}/usr/local/lib"
	mv "${srcdir}/usr/lib/x86_64-linux-gnu/libfftranscode.so.0.0.0" "${pkgdir}/usr/local/lib/"
	ln -s "${pkgdir}/usr/local/lib/libfftranscode.so.0.0.0" "${pkgdir}/usr/local/lib/libfftranscode.so.0"
	ln -s "${pkgdir}/usr/local/lib/libfftranscode.so.0.0.0" "${pkgdir}/usr/local/lib/libfftranscode.so"

	mkdir -p "${pkgdir}/usr/local/lib/pkgconfig"
	install -D "${srcdir}/libfftranscode.pc" "${pkgdir}/usr/local/lib/pkgconfig/"

	mkdir -p "${pkgdir}/usr/local/include"
	mv "${srcdir}/usr/include/fftranscode/" "${pkgdir}/usr/local/include/"
}
