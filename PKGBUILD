# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: varris <varris@protonmail.com>
pkgname=krakenx-git
pkgver=0.0.3.r22.583060b
pkgrel=1
pkgdesc='Python script to control NZXT Kraken X52/X62/X72 coolers'
arch=('any')
url='https://github.com/KsenijaS/krakenx.git'
license=('GPL')
depends=('python' 'liquidctl')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/KsenijaS/krakenx.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
