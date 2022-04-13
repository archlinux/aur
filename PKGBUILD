# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=pmbootstrap-git
pkgver=1.42.0.r12.gfaf52391
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS (git)'
arch=(any)
url=https://postmarketos.org
license=(GPL)
depends=(python-setuptools)
makedepends=(python-build python-installer python-wheel git)
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
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
