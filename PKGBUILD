# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=fasm
pkgname="python-$_pkgname-git"
pkgver=0.0.r47.g4857dde
pkgrel=1
pkgdesc="FPGA Assembly (FASM) Parser and Generation library"
arch=(any)
url="https://github.com/SymbiFlow/fasm"
license=('ISC')
depends=('python' 'python-textx')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=(fasm "${pkgname%%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
