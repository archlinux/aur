# Maintainer: Hugo Sales <hugo (at) fc (dot) up (dot) pt>

pkgname=openbugs
pkgver=3.2.3
pkgrel=1
pkgdesc="OpenBUGS, a software package for performing Bayesian inference Using Gibbs Sampling"
arch=('any')
url="http://openbugs.net/w/FrontPage"
license=('GPL2')
source=(
	"http://openbugs.net/w/OpenBUGS_3_2_3?action=AttachFile&do=get&target=OpenBUGS-$pkgver.tar.gz"
)

md5sums=(
	"SKIP"
)

depends=('lib32-gcc-libs')

provides=('openbugs')

build() {
	tar zxf *OpenBUGS-$pkgver.tar.gz
        cd OpenBUGS-$pkgver
        ./configure
	make
        sed -i s/OpenBUGSCli/openbugscli/g bin/OpenBUGS
}

package() {
        mkdir -p $pkgdir/usr/{bin,lib}
	cp -f ${srcdir}/OpenBUGS-$pkgver/bin/OpenBUGS $pkgdir/usr/bin/openbugs
        cp -f ${srcdir}/OpenBUGS-$pkgver/src/OpenBUGSCli $pkgdir/usr/bin/openbugscli
        cp -f ${srcdir}/OpenBUGS-$pkgver/lib/libOpenBUGS.so $pkgdir/usr/lib
}
