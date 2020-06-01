# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
pkgname=python-django-stdimage-git
pkgver=3.0.0.r26.g4c7194a
pkgrel=1
pkgdesc="Django Standardized Image Field"

provides=("python-django-stdimage")
url="https://github.com/codingjoe/django-stdimage"
arch=("any")
license=("mit")

source=("$pkgname::git+$url")
depends=("python-django" "python-pillow" "python-progressbar")
makepepends=("python-setuptools")
checkdepends=("python-pytest" "python-pytest-runner" "python-pytest-django" "python-pytest-cov")


pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$pkgname"
	env PYTHONPATH="$srcdir/$pkgname" pytest
}

build() { 
	cd "$pkgname"
	python setup.py build 
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/python-django-stdimage/LICENSE
}

md5sums=("SKIP")
