# Maintainer: Anima <animafps@pm.me>
# Maintainer: Klaus Zipfel <klaus (at) zipfel (dot) family>
# Contributor: Christopher Williams <chilliams (at) gmail (dot) com>

#pkgbase=leetmouse
pkgname=('leetmouse-driver-dkms')
pkgver=0.9.0
pkgrel=1
pkgdesc="USB HID Boot Protocol mouse driver with acceleration."
arch=('i686' 'x86_64')
url="https://github.com/animafps/leetmouse"
license=('GPL2')
#makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/animafps/leetmouse.git" 'leetmouse-driver-dkms.install')
depends=('udev' 'dkms')
install='leetmouse-driver-dkms.install'

package() {
    cd "$pkgname"
    install -dm 755 "${pkgdir}"/usr/src
    install -m 644 -v -D Makefile "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/Makefile
	install -m 644 -v -D install_files/dkms/dkms.conf "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/dkms.conf
	install -m 755 -v -d driver "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/driver
	install -m 644 -v -D driver/Makefile "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/driver/Makefile
	install -m 644 -v driver/*.c "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/driver/
	install -m 644 -v driver/*.h "$pkgdir"/usr/src/leetmouse-driver-${pkgver}/driver/
    install -Dm644 install_files/udev/99-leetmouse.rules "$pkgdir"/usr/lib/udev/rules.d/99-leetmouse.rules
	install -Dm755 install_files/udev/leetmouse_bind "$pkgdir"/usr/lib/udev/leetmouse_bind
	install -Dm755 install_files/udev/leetmouse_manage "$pkgdir"/usr/lib/udev/leetmouse_manage
}
sha256sums=('SKIP'
            '65b278cee04bcf59351d6fb4827466c83786f9fc0ff429648c32b81d1fb78cd9')
