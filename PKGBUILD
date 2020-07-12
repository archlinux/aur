# Maintainer: katt <magunasu.b97@gmail.com>
pkgname=pmbootstrap-git
pkgver=1.21.0.r0.gae21bc86
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
arch=(any)
url='https://postmarketos.org'
license=(GPL)
depends=(python-setuptools)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+'https://gitlab.com/postmarketOS/pmbootstrap.git')
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
	python setup.py install -O1 --root="$pkgdir"
}
