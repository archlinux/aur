# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=pydecor
pkgname=python-$_pkgname-git
pkgver=2.0.0.r11.gd506ca8
pkgrel=1
pkgdesc="Easy-peasy Python decorators"
arch=(any)
url="https://github.com/mplanchard/pydecor"
license=('MIT')
depends=('python' 'python-dill' 'python-six')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=("git+$url.git")

sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	PYTHONPATH=src pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
