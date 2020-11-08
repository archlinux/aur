# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Based on python-readability-lxml package from BrainDamage

pkgname=python-readability-lxml-git
pkgver=v0.8.1.r4.gf166003
pkgrel=1
pkgdesc="A python port of a ruby port of arc90 readability project"
arch=("any")
url="https://pypi.org/project/readability-lxml/"
license=("custom:Apache")
depends=("python" "python-chardet" "python-cssselect" "python-lxml")
provides=("python-readability-lxml")
conflicts=("python-readability-lxml")
sha256sums=("SKIP" "1f2afa61a3e7d62e5cf62b471c60c40853effc3428289f5961c84e24cf60447a")
source=("readability::git+https://github.com/buriy/python-readability" "LICENSE")

pkgver() {
  cd "$srcdir/readability"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/readability"
	python setup.py build
}

package() {
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/python-readability-lxml/LICENSE"
	cd "$srcdir/readability"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -m644 -D README.rst "$pkgdir/usr/share/doc/python-readability-lxml/README.rst"
}
