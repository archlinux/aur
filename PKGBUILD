# Maintainer: katt <magunasu.b97@gmail.com>
pkgname=pmbootstrap-git
pkgver=1.29.2.r11.gaf2b2b59
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS (git)'
arch=(any)
url=https://postmarketos.org
license=(GPL)
depends=(python-setuptools)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://gitlab.com/postmarketOS/pmbootstrap.git)
md5sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	python setup.py build
}

package() {
	cd "${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
