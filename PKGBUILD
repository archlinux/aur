# Maintainer: Jason Pollitt  <snostormjp+aur @ gmail.com>
pkgname="canon-ts9020"
pkgver="2.5.40"
pkgrel="2"
pkgdesc="Canon TS9020 MFC cups and scanner Drivers"
url="https://www.usa.canon.com/internet/portal/us/home/support/details/printers/inkjet-multifunction/ts-series-inkjet/ts9020-white?tab=drivers#Z7_MQH8HIC0L88RB0AMD0F1Q42K25"
license=('GPL2')
#cnj
# http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwODM5ODAx&cmp=ABR&lang=EN
#scanner
#http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwODQwMTAx&cmp=ABR&lang=EN
arch=('x86_64')
depends=('cups') 
sha256sums=('559acc98851ecf86000724ee268b473818b395c6b87524dc0d82ead6263a6ab5'
            'da7fddf03d95b487b55795812c9a27a00aa027a8f3bbcc76ead54ce07108976b'
            )

source=("cnijfilter2-5.40-1-rpm.tar.gz::http://gdlp01.c-wss.com/gds/8/0100008398/01/cnijfilter2-5.40-1-rpm.tar.gz"
	"scangearmp2-3.40-1-rpm.tar.gz::http://gdlp01.c-wss.com/gds/1/0100008401/01/scangearmp2-3.40-1-rpm.tar.gz"
)

prepare() {
        echo `pwd`
        cp cnijfilter2-5.40-1-rpm/packages/cnijfilter2-5.40-1.$CARCH.rpm ./.
        bsdtar -xvf cnijfilter2-5.40-1.$CARCH.rpm
        cp scangearmp2-3.40-1-rpm/packages/scangearmp2-3.40-1.$CARCH.rpm ./.
        bsdtar -xvf scangearmp2-3.40-1.$CARCH.rpm
        rm -rf cnijfilter2-5.40-1.$CARCH.rpm
        rm -rf scangearmp2-3.40-1.$CARCH.rpm
}

package() {
	# coping files
	cp -rf */ ${pkgdir}/
        cd "$pkgdir"/usr
        # mv manufacture lib64 to lib so it works with arch filesystem
        cp -rf lib64/* lib/.
        rm -rf lib64
} 
