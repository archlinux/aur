# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chkrootkit
pkgver=0.53
pkgrel=2
pkgdesc="Locally checks for signs of a rootkit"
arch=('x86_64')
url="http://www.chkrootkit.org/"
license=( 'CUSTOM' )
install=
changelog=
noextract=()
# Is this necessary for ifpromisc?
#depends=('net-tools')
optdepends=('tiger: a wrapper for chkrootkit')
source=("ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit-${pkgver}.tar.gz"
        "chkrootkit-${pkgver}.tar.gz.sig")
sha512sums=('f8de19d0a61ccb6ac184ad6642d78041729cba799eedcc8088cb6d2c5cf4de0574c6083caad364576a601265322e61c183b266304f00667527bf29fdc51359c7'
            'SKIP')
build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        make sense
}
package() {
	for f in check_wtmpx chkdirs chklastlog chkproc chkrootkit chkutmp chkwtmp ifpromisc strings-static;
	do
        	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/${f} ${pkgdir}/usr/bin/${f}
	done
        install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT ${pkgdir}/${pkgname}/usr/share/licenses/${pkgname}/LICENSE
        for f in ACKNOWLEDGMENTS README;  # sic
	do
        	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/${f} ${pkgdir}/${pkgname}/usr/share/doc/${pkgname}/${f}
	done
}
