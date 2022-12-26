# Maintainer: Davide Depau <davide@depau.eu>

_pkgname='validity-sensors-tools'
pkgname="${_pkgname}-git"
pkgver=0.5.r27.g5ba2094
pkgrel=2
pkgdesc='Linux tool to flash and pair Validity fingerprint sensors 009x'
arch=('x86_64')
url='https://github.com/3v1n0/python-validity'
license=('unknown')
depends=(
  'python-pycryptodome'
  'python-pyusb'
  'python-fastecdsa'
  'innoextract'
  'libusb'
  'usbutils'
)
makedepends=('python-setuptools')
provides=("$_pkgname" "python-proto9x")
conflicts=("$_pkgname" "python-proto9x")
source=(
  "$_pkgname::git+https://github.com/3v1n0/python-validity.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

