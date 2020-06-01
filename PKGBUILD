# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
_pkgname=python-django-tex
pkgname=$_pkgname-git
pkgver=1.1.7.r0.g75ddacd
pkgrel=1
pkgdesc="A simple Django app to render LaTeX templates and compile them into PDF files."

provides=("$_pkgname")
url="https://github.com/weinbusch/django-tex"
arch=("any")
license=("MIT")

source=("$pkgname::git+$url")
depends=("python-django>=2.2" "texlive-bin" "python-jinja>=2.9.6")
makepepends=("python-setuptools")


pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
