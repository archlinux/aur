# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=rainbowcrack
pkgver=1.8
pkgrel=1
pkgdesc="Rainbow table generation/use"
arch=( 'x86_64' )
url="http://project-rainbowcrack.com"
license=( 'custom' )
_pkgname=rainbowcrack
install=
changelog=
noextract=()
source=("http://project-rainbowcrack.com/${pkgname}-${pkgver}-linux64.zip"
	"LICENSE"
	"rainbowcrack.sh"
        "${pkgname}-${pkgver}-linux64.zip.sig"
	"LICENSE.sig"
	"rainbowcrack.sh.sig")
sha512sums=('84dbf3431605fb5dcc8e7cd305a43e9b239ebd6e5ef120edd951a3180c38498fe3a26157e3b55d114c6630f8ac1382a610d8e6230779c5b12cbc42c04e9aff57'
	    '35fc70a7205f75ce5f6299e730d955bff9d9d1eb1148205c76c75712901552beaa05108bd0ccb90a028dc976ec3bb24e9902af8ae636ed3ecafd11184bdfb598'
	    '3a546a089c68b2790b640865e047f3f19f5387efccfa847413535be0035c05d0b63b9df36232078d829674577011657f980e3ae0711b0cb3aadb7ebb55a2c85a'
            'SKIP'
	    'SKIP'
	    'SKIP')
package() {
        install -d -m0755 ${pkgdir}/opt/${pkgname}
	install -d -m0755 ${pkgdir}/usr/bin
        install -d -m0755 ${pkgdir}/usr/share/doc/${pkgname}
        install -d -m0755 ${pkgdir}/usr/share/licenses/${pkgname}

	install -D -m0755 ${srcdir}/rainbowcrack.sh ${pkgdir}/usr/bin/rainbowcrack
	for b in rcrack rt2rtc rtc2rt rtgen rtmerge rtsort;
	do
		install -D -m0755 ${srcdir}/${pkgname}-${pkgver}-linux64/${b} ${pkgdir}/opt/${pkgname}/${b}
		ln -sf /usr/bin/rainbowcrack ${pkgdir}/usr/bin/${b}
	done

	for f in alglib0.so charset.txt;
	do
		install -D -m0644 ${srcdir}/${pkgname}-${pkgver}-linux64/${f} ${pkgdir}/opt/${pkgname}/${f}
	done

	install -D -m0644 ${srcdir}/${pkgname}-${pkgver}-linux64/readme.txt ${pkgdir}/usr/share/doc/${pkgname}/README
	install -D -m0644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
