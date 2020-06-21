# Maintainer: Davide Depau <davide@depau.eu>

_pkgname='validity-sensors-tools'
pkgname="${_pkgname}-git"
pkgver=0.5.r27.g5ba2094
pkgrel=1
pkgdesc='Linux tool to flash and pair Validity fingerprint sensors 009x'
arch=('x86_64')
url='https://github.com/3v1n0/python-validity'
license=('unknown')
depends=(
  'python-pycrypto'
  'python-pyusb'
  'python-fastecdsa=1.7.4'
  'innoextract'
  'libusb'
  'usbutils'
)
makedepends=('python-setuptools')
provides=("$_pkgname" "python-proto9x")
conflicts=("$_pkgname" "python-proto9x")
source=(
  "$_pkgname::git+https://github.com/3v1n0/python-validity.git"
  "0001-Monkey-patch-time-to-fix-bug-in-pycrypto.patch"
)
sha256sums=('SKIP'
            '9987b7765ff2921250de1c378b5cb8ac6f05d9f133211f0add358dffda6e33c1')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -p1 < ../0001-Monkey-patch-time-to-fix-bug-in-pycrypto.patch
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

