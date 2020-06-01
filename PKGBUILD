# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
pkgname="python-django-dbbackup-git"
pkgver=2.5.0.r194.ge0d3eaf
pkgrel=1
pkgdesc="Management commands to help backup and restore your project database and media files"

provides=("python-django-dbbackup")
url="https://django-dbbackup.readthedocs.io/en/stable/"
arch=("any")

source=("$pkgname::git+https://github.com/django-dbbackup/django-dbbackup")

depends=("python" "python-django>=1.5" "python-six" "python-pytz")
makedepends=("python-setuptools"
# for tests
	"python-mock" "python-pep8" "python-pylint" "python-coverage" "python-gnupg" "python-django-storages"
	"python-testfixtures" 
)

pkgver() {
        cd "$pkgname"
        git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$pkgname"
	python runtests.py
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=("SKIP")

