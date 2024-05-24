# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgname=python-pulp-git
_name=pulp
pkgver=v2.1.r159.gcfb8a0f
pkgrel=1
pkgdesc="A python Linear Programming API"
url=https://github.com/coin-or/pulp
license=(BSD)
arch=(any)
depends=(python)
makedepends=(python-pip)
source=(git+https://github.com/coin-or/pulp)
sha256sums=(SKIP)
conflicts=(python-pulp)
provides=(python-pulp)

pkgver() {
	cd "${srcdir}/${_name}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "${srcdir}/${_name}"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps .
}
