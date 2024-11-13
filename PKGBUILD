# Contributor: katt <magunasu.b97@gmail.com>
# Maintainer: fossdd <fossdd@pwned.life>

pkgname=pmbootstrap-git
pkgver=3.0.0.r0.g79c6e4c
pkgrel=2
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS (git)'
arch=(any)
url=https://postmarketos.org
license=(GPL-3.0-only)
depends=(python python-argcomplete multipath-tools util-linux)
makedepends=(python-build python-installer python-setuptools python-wheel git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://gitlab.postmarketos.org/postmarketOS/pmbootstrap.git)
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
