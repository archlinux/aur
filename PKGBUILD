# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=vtr-xml-utils
pkgname="python-$_pkgname-git"
pkgver=r86.d6ba1f1
pkgrel=2
pkgdesc="Utilities for working with VtR XML Files"
arch=(any)
url="https://github.com/SymbiFlow/vtr-xml-utils"
license=('ISC')
depends=('python' 'python-lxml')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner')
provides=("${pkgname%%-git}")
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

	touch tests/__init__.py
	pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
