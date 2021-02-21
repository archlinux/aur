# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
# Please submit issues/patches/pull-requests at:
# https://github.com/sinisterstuf/PKGBUILD-python-adafruit-gpio-git

pkgname=python-adafruit-gpio-git
pkgver=r75.cdf7a7b
pkgrel=1
pkgdesc="Library to provide a cross-platform GPIO interface on the Raspberry Pi and Beaglebone Black using the RPi.GPIO and Adafruit_BBIO libraries."
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_GPIO"
license=('MIT')
groups=()
depends=('python' 'python-smbus')
optdepends=(
	'python-raspberry-gpio: for Raspberry Pi support'
	'python-adafruit_bbio-git: for BeagleBone support'
	'libftdi: for FT232H support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/adafruit/Adafruit_Python_GPIO.git")
md5sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	2to3 -wn .
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root "${pkgdir}/"
}
