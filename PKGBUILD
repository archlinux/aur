# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-symbiflow-v2x
pkgname=v2x-git
pkgver=0.0.r588.g9554cc4
pkgrel=1
pkgdesc="A tool for converting specialized annotated Verilog models into XML"
arch=(any)
url="https://github.com/SymbiFlow/python-symbiflow-v2x"
license=('ISC')
depends=('python' 'python-lxml')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-vtr-xml-utils' 'yosys>0.9')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
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

	touch tests/__init__.py
	pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
