# Maintainer: katt <magunasu.b97@gmail.com>
pkgname=pmbootstrap-git
pkgver=0.9.r437.g8a02187a
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
arch=(any)
url='https://postmarketos.org'
license=('GPL')
depends=('python-setuptools')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://gitlab.com/postmarketOS/pmbootstrap.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install -O1 --root="$pkgdir"
}
