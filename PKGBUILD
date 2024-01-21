pkgname=wiringop-orangepi-5-plus-git
pkgver=2.52
pkgrel=1
pkgdesc='wiringPi for Orange Pi 5 Plus'
arch=('x86_64' 'aarch64')
url='https://github.com/orangepi-xunlong/wiringOP'
license=('LGPL-3.0')
makedepends=('git' 'make' 'gcc' 'wiringop-orangepi-5-plus-base-git')
_commit="ce520ea17701445eb2e8e3cc1b6e157d29b63713"

source=(
	"git+https://github.com/orangepi-xunlong/wiringOP#commit=${_commit}"
)

md5sums=(SKIP)

build() {
	cd "${srcdir}/wiringOP"
	# gpio
	cd gpio
	make
}

package() {
	cd "${srcdir}/wiringOP"
	# gpio
        cd gpio
	mkdir -p "${pkgdir}/usr/local/bin"
	cp gpio "${pkgdir}/usr/local/bin"
	chown root:root "${pkgdir}/usr/local/bin/gpio"
	chmod 4755 "${pkgdir}/usr/local/bin/gpio"
	# /usr/local/share/man exists in filesystem (owned by filesystem)
	#mkdir -p "${pkgdir}/usr/local/share/man/man1"
	#cp gpio.1 "${pkgdir}/usr/local/share/man/man1/"
	#install -m 0755 -d "${pkgdir}/usr/local/share/man/man1/"
	#install -m 0644 gpio.1 "${pkgdir}/usr/local/share/man/man1/"
}
