# Maintainer: loredan13
# Contributor: lf <packages at lfcode dot ca>
pkgname=klipper-git
pkgver=r2730.ac863a95
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/KevinOConnor/klipper"
license=('GPLv3')
groups=()
depends=(
	python2-cffi
	python2-pyserial
	python2-greenlet
	python2-jinja
	ncurses
	libusb
	avrdude
	avr-gcc
	avr-binutils
	avr-libc
)
optdepends_x86_64=(
	'arm-none-eabi-gcc: for ARM MCU firmware compilation'
	'arm-none-eabi-newlib: for ARM MCU firmware compilation'
	'stm32flash: for flashing firmware on STM MCU'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/KevinOConnor/klipper#branch=master' 'klipper.service' 'sysusers.conf' 'tmpfiles.conf')
noextract=()
md5sums=('SKIP'
         '4bb29bd138c4b01e15a09d2c1a0d0f66'
         '61912d101dc7c68c7314882b80621454'
         '1a71747e1579e5d5503b95c3a6aa681f')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/klipper.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/klipper.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/klipper.conf"
	install -dm777 "$pkgdir/opt/klipper"
	install -dm775 "$pkgdir/etc/klipper"
	GLOBIGNORE=.git cp -r * "$pkgdir/opt/klipper"
}
