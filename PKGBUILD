# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-markdownx
pkgname=$_pkgname-git
pkgver=4.0.11.r0.g36cd358
pkgrel=1
pkgdesc="Comprehensive Markdown plugin built for Django"
arch=("any")
url="https://github.com/neutronX/django-markdownx"
license=("BSD-2-Clause-Views")
depends=(
	"python"
	"python-django"
	"python-pillow"
	"python-markdown"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
