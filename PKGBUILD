# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=xc-fasm
pkgname="python-$_pkgname-git"
pkgver=r72.e12f313
pkgrel=1
pkgdesc="Library to convert FASM files to bitstream"
arch=(any)
url="https://github.com/SymbiFlow/xc-fasm"
license=('ISC')
depends=('python' 'python-intervaltree' 'python-simplejson' 'python-textx' 'python-prjxray' 'python-fasm')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	# should really be fixed upstream
	touch tests/__init__.py
	# tests need to be updated to new prjxray-db layout
	# pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# https://github.com/SymbiFlow/xc-fasm/issues/10
	#install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
