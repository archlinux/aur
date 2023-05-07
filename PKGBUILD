# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=cmake-build-extension
pkgname="python-$_pkgname-git"
pkgver=0.5.1.r3.gfea4503
pkgrel=2
pkgdesc="Setuptools extension to build and package CMake projects"
arch=(any)
url="https://github.com/diegoferigo/cmake-build-extension"
license=('MIT')
depends=('python' 'python-gitpython' 'ninja' 'cmake')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
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

	#pytest --ignore examples
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
