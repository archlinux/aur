# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-git
pkgver=1.2.0rc2.r7.8de7d64
pkgrel=1
pkgdesc="Cross-platform CLI and Python drivers for AIO liquid coolers and other devices"
arch=('any')
url="https://github.com/jonasmalacofilho/liquidctl"
license=('GPL3')
depends=('python' 'python-docopt' 'python-pyusb' 'python-hidapi' 'python-appdirs')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/jonasmalacofilho/liquidctl.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
