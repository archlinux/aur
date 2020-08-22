# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
pkgname='alluvium-git'
_pkgname='alluvium'
pkgver=20200614.r4_bc9fed7
pkgrel=1
pkgdesc='Generate visual overlays from your i3 bindings'
url='https://github.com/cqql/alluvium'
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')
license=('GPL3')
arch=('x86_64')
provides=("alluvium")
conflicts=("alluvium")
sha256sums=('SKIP')

BUILDENV+=('!check')

source=(
	"$_pkgname::git+https://github.com/cqql/alluvium/#branch=${BRANCH:-master}"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
		local DATE=$(git log -1 --format="%cd" --date=short | sed s/-//g)
		local COUNT=$(git rev-list --count HEAD)
		local COMMIT=$(git rev-parse --short HEAD)
		printf "%s.r%s_%s" "$DATE" "${COUNT}" "${COMMIT}"
}

check() {
    cd "${srcdir}/${_pkgname}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
