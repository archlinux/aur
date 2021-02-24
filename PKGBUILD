# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
_pkgname=python-django-js-asset
pkgname=$_pkgname-git
pkgver=1.2.2.r16.g4659e2f
pkgrel=1
pkgdesc="script tag with additional attributes for django.forms.Media"

provides=("$_pkgname")
url="https://github.com/matthiask/django-js-asset/"
arch=("any")
license=("bsd")
source=("$pkgname::git+https://github.com/matthiask/django-js-asset.git")
depends=("python-django")
makedepends=("python-setuptools" "git")
checkdepends=("python-pytz")

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$pkgname/tests/"
	python manage.py test
}

build() { 
	cd "$pkgname"
	python setup.py build 
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}

md5sums=("SKIP")
