pkgname=lang815
_gitname=lang815
pkgver=0.4
pkgrel=1
pkgdesc="Change keys led color, when language layout is changed for Logitech G213, G410, G413. G512, G513, G610, G810, G815, G910 and GPRO Keyboards. Only X11"
arch=('any')
url="https://gitlab.com/SR_team/lang815"
license=('GPL3')
depends=('hidapi' 'g810-led-lib' 'libx11')
makedepends=('git' 'gcc' 'make' 'cmake' 'nlohmann-json' 'sdbus-cpp' 'xdg-utils-cxx')
install=${pkgname}.install
provides=("Lang815srv=${pkgver}")
options=(!emptydirs)
source=("git+https://gitlab.com/SR_team/lang815.git")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	cmake -DCMAKE_BUILD_TYPE=MinSizeRel .
	make
}

package() {
	cd ${_gitname}
	mkdir -p ${pkgdir}/etc/systemd/user/
	mkdir -p ${pkgdir}/etc/dbus-1/system.d/
	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/lib/
	mkdir -p ${pkgdir}/usr/lib32/
	mkdir -p ${pkgdir}/usr/include/lang815/
	cp org.lang815.switch.service ${pkgdir}/etc/systemd/user/
	cp org.lang815.switch.conf ${pkgdir}/etc/dbus-1/system.d/
	cp Lang815srv ${pkgdir}/usr/bin/
	cp libLang815.so ${pkgdir}/usr/lib/
	cp libLang815_x86.so ${pkgdir}/usr/lib32/libLang815.so
	cp libLang815bkg-g810-led.so ${pkgdir}/usr/lib/
	cp IBackend.h ${pkgdir}/usr/include/lang815/
	cp Config.h ${pkgdir}/usr/include/lang815/
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod 644 ${pkgdir}/etc/systemd/user/org.lang815.switch.service
	chmod 644 ${pkgdir}/etc/dbus-1/system.d/org.lang815.switch.conf
}
