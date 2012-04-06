# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=openrtm-aist
pkgver=1.0.0
pkgrel=1
pkgdesc="The RT-Middleware provides a common platform for Robot Technology (RT)"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('omniorb' 'ace')
source=(http://www.openrtm.org/pub/OpenRTM-aist/cxx/1.0.0/OpenRTM-aist-${pkgver}-RELEASE.tar.bz2)
md5sums=('950b5726e87f29d1c3abe6a85ef0d4cb')

build() {
	cd ${srcdir}/OpenRTM-aist-${pkgver}
	
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd ${srcdir}/OpenRTM-aist-${pkgver}
	
	make DESTDIR=${pkgdir} install
	
	cd ${pkgdir}/etc
	
	# move rtc.conf.template to rtc.conf
	install -D -m644 rtc.conf.sample rtc.conf
	rm rtc.conf.sample
}

