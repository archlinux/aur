# Maintainer: Ivan Naydonov <samogot@gmail.com>
pkgname=ricoh-sp220-sane
pkgver=1.01
pkgrel=1

pkgdesc="SANE driver for Ricoh SP220 series"
arch=('i686' 'x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp221s/sp221s.htm"
license=('unknown')
group=('ricoh-sp220-all')

depends=('udev' 'sane')
makedepends=('binutils' 'p7zip')


install='ricoh-sp220-sane.install'
source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001300/0001300723/V101/r78188en.exe)
md5sums=('6c86c0f9ffdb5320e677284aa5a8da8f')

backend_name=sp_200series
mysanelib=libsane-${backend_name}.so.${pkgver}.0

prepare() {
	ar x sp-200series_Scanner-$pkgver-noarch.deb
	tar -zxf data.tar.gz
	if [ "${CARCH}" = 'x86_64' ]; then
	  cp -f tmp/x64/$mysanelib usr/lib/sane/$mysanelib
	  cp -f tmp/x64/libpmxnet-rxesg.so  usr/lib/ricoh_px/libpmxnet-rxesg.so
	  cp -f tmp/x64/libpmxusb-rxesg.so  usr/lib/ricoh_px/libpmxusb-rxesg.so
	fi
	ln -s /usr/lib/sane/$mysanelib usr/lib/sane/libsane-${backend_name}.so
	ln -s /usr/lib/sane/$mysanelib usr/lib/sane/libsane-${backend_name}.so.1
}

package() {
	install -d $pkgdir/usr
	install -d $pkgdir/etc
	cp -a usr etc $pkgdir
}
