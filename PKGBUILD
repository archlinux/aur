# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=python-minesight-git
_pkgname=minesight
pkgver=r1.c22400c
pkgrel=2
pkgdesc="Minecraft OSINT tool"
arch=('any')
url="https://github.com/Gobutsu/MineSight"
license=('AGPL-3.0-only')
depends=(
	python
	python-httpx
	python-rich
	python-beautifulsoup4
	python-jsonpath-ng
	python-importlib-metadata
	python-setuptools
)
makedepends=(git python-build python-installer python-wheel)
provides=("$_pkgname")

source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
