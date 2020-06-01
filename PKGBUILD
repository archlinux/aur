# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
_pkgname=python-django-markdownify
pkgname=$_pkgname-git
pkgver=0.8.0.r5.gf5b7e2e
pkgrel=1
pkgdesc="Markdown template filter for Django"

provides=("$_pkgname")
url="https://github.com/erwinmatijsen/django-markdownify"
arch=("any")
license=("MIT")

source=("$pkgname::git+$url")
depends=("python-django" "python-markdown" "python-bleach")
makepepends=("python-setuptools")


pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# patch readme line
	cd "$pkgname"
	sed 's/README.rst/README.md/' -i setup.py
}

build() { 
	cd "$pkgname"
	python setup.py build 
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

md5sums=("SKIP")
