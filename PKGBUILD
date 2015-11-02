# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
# Please submit issues/patches/pull-requests at:
# https://github.com/sinisterstuf/PKGBUILD-python-adafruit-charlcd-git

pkgname=python-adafruit-charlcd-git
pkgver=r17.97694de
pkgrel=1
pkgdesc="Python library for accessing Adafruit character LCDs from a Raspberry Pi or BeagleBone Black."
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_CharLCD"
license=('MIT')
groups=()
depends=('python' 'python-adafruit-gpio')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/adafruit/Adafruit_Python_CharLCD.git")
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
