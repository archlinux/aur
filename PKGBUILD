# Maintainer: lf <aur@lfcode.ca>
pkgname=servoblaster-git
pkgver=r73.96014c8-1
pkgrel=1
pkgdesc="A servo control program for the Raspberry Pi"
arch=('armv6h' 'armv7h') # does not currently include armv8; not clear whether
                         # servoblaster supports it
url="https://github.com/richardghirst/PiBits/tree/master/ServoBlaster"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc' 'make')
provides=('servoblaster')
conflicts=('servoblaster')
source=('git+https://github.com/richardghirst/PiBits' 'servod.service' 'servod_default')
md5sums=('SKIP' '3cfb8cdcdab6ddbb291e38b29b912136' '553967f8c2e81a3c96bc1671e57eee9b')

pkgver() {
	cd "${srcdir}/PiBits"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/PiBits/ServoBlaster/user"
	make
}

package() {
	cd "${srcdir}/PiBits/ServoBlaster/user"
	install -Dm 0755 servod "${pkgdir}/usr/bin/servod"
	install -Dm 0644 "${srcdir}/servod.service" "${pkgdir}/usr/lib/systemd/system/servod.service"
	install -Dm 0644 "${srcdir}/servod_default" "${pkgdir}/etc/default/servod"
}
