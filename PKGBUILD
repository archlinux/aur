# Maintainer: katt <magunasu.b97@gmail.com>

# shellcheck disable=SC2034
variant=custom-pmaports
_pkgname="pmbootstrap"
pkgname="pmbootstrap-${variant}-git"
pkgver=1.42.0.r12.gfaf52391
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS (git)'
arch=(any)
url=https://postmarketos.org
license=(GPL)
depends=(python-setuptools)
makedepends=(python-build python-installer python-wheel git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.com/tallero/${_pkgname}.git#branch=${variant}")
md5sums=(SKIP)

pkgver() {
	cd "${_pkgname}" || exit
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}" || exit
	python -m build --wheel --no-isolation
}

# shellcheck disable=SC2154
package() {
	cd "${_pkgname}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
