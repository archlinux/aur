_pkgname=python-geomag
pkgname=$_pkgname-todd-dembrey-git
pkgver=r31.421564e
pkgrel=2
arch=("any")
license=("LGPL")
url="https://github.com/todd-dembrey/geomag"
makedepends=("git")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url" "data-install.patch")
sha1sums=("SKIP" "SKIP")

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname

	patch -Np1 -i "$srcdir"/data-install.patch
}

build() {
	cd $_pkgname

	python setup.py build
}

package() {
	cd $_pkgname

	python setup.py install --root="$pkgdir" --optimize=1
}
