# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=pytorch_influence_functions
pkgname=python-pytorch-influence-functions-git
pkgver=r18.7b7c7b6
pkgrel=1
pkgdesc='PyTorch reimplementation of Influence Functions'
arch=(any)
url='https://github.com/nimarb/pytorch_influence_functions'
license=(GPL)
depends=(python-pytorch)
makedepends=(git python-setuptools)
provides=(python-pytorch-influence-functions)
conflicts=(python-pytorch-influence-functions)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${_pkgname}"
	python setup.py build
}

package() {
	cd "${_pkgname}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
