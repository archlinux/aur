# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>

pkgname=python-libcsearcher-git
pkgver=r27.9e380c4
pkgrel=1
pkgdesc="LibcSearcher-ng -- get symbols' offset in glibc. "
arch=('any')
url="https://github.com/dev2ero/LibcSearcher"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
pkgver() {
	cd ${pkgname}
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
prepare(){
	cd ${pkgname}
	mkdir LibcSearcher
	mv LibcSearcher.py LibcSearcher
	echo "from .LibcSearcher import *" > ./LibcSearcher/__init__.py
}
build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
