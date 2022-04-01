# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=esorex
pkgver=3.13.5
pkgrel=1
pkgdesc="EsoRex is the ESO Recipe Execution Tool. It can list, configure and execute CPL-based recipes from the command line."
url="https://www.eso.org/sci/software/cpl/esorex.html"
arch=('x86_64')
license=('GPL2')
depends=(cpl)
makedepends=(cpl)
provides=()
conflicts=()
replaces=()
backup=()
source=(https://ftp.eso.org/pub/dfs/pipelines/libraries/esorex/esorex-${pkgver}.tar.gz
        esorex)
sha256sums=('417def5a893dda3396a363007ad2537ab1804d56efc9f41f6b95be61c6eb1894'
            '2b787e7133f31d36e2395c0e2a44eabe541594e74ea579cb85f8b6b9fc5bcaf5')


build() {

	export LD_LIBRARY_PATH=${CPLDIR}/lib
	
	cd $srcdir/${pkgname}-${pkgver}
	./configure --prefix=/opt/esopipes --with-cpl=${CPLDIR}
	make

}

package() {

	cd $srcdir/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m755 ${srcdir}/esorex ${pkgdir}/usr/bin/esorex
}

# vim:set ts=4 sw=4 et:
