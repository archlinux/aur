# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=symbolator
pkgname=$_pkgname-git
pkgver=r38.a9b24e4
pkgrel=1
pkgdesc="HDL symbol generator"

arch=("any")
license=("mit")
url="https://github.com/kevinpt/symbolator.git"
provides=("$_pkgname")

depends=("python" "python-hdlparse" "python-cairo" "python-docutils")
makedepends=("python-setuptools")
optdepends=("sphinx: for symbolator sphinx integration support")

source=("$_pkgname::git+$url")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}

md5sums=("SKIP")
