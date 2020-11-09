# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-sdf-timing
pkgname="$_pkgname-git"
pkgver=r104.5740ac4
pkgrel=1
pkgdesc="Python library for working Standard Delay Format (SDF) Timing Annotation files"
arch=(any)
url="https://github.com/SymbiFlow/python-sdf-timing"
license=('ISC')
depends=('python' 'python-ply')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
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

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
