# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-git
pkgver=1.2.0rc2.r6.bd2f861
pkgrel=2
pkgdesc="Cross-platform CLI and Python drivers for AIO liquid coolers and other devices"
arch=('any')
url="https://github.com/jonasmalacofilho/liquidctl"
license=('GPL3')
depends=('python' 'python-docopt' 'python-pyusb' 'python-hidapi' 'python-appdirs')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('python-liquidctl::git+https://github.com/jonasmalacofilho/liquidctl.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
