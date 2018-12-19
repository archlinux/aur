# Maintainer: Ivan Naydonov <samogot@gmail.com>
pkgname=ricoh-sp220-som
pkgver=1.07
pkgrel=1

pkgdesc="Smart Organizing Monitor Utility for Ricoh SP220 series"
arch=('i686' 'x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp221s/sp221s.htm"
license=('unknown')
group=('ricoh-sp220-all')

depends=('udev' 'qt4>=4.6.0' 'libusb0>=0.1.12')
makedepends=('binutils' 'p7zip')

install='ricoh-sp220-som.install'
if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
	source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001300/0001300712/V107/r79280en.exe)
	md5sums=('7ac157b3575f178cc0ea0897a0136549')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
	source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001300/0001300711/V107/r79279en.exe)
	md5sums=('691d1ac9c951c3f1edeb0f3644ee16e4')
fi

prepare() {
	ar x som-sp-200-series_${pkgver}_$ARCH.deb
	tar -zxf data.tar.gz
	chmod u+s opt/smart-organizing-monitor-for-sp-200series/pingtool
}

package() {
	install -d $pkgdir/etc
	install -d $pkgdir/opt
	install -d $pkgdir/usr
	cp -a etc opt usr $pkgdir
}
