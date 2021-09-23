# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>

pkgname=python-libcsearcher-git
pkgver=r24.10128fe
pkgrel=1
pkgdesc="LibcSearcher-ng -- get symbols' offset in glibc. "
arch=('any')
url="https://github.com/dev2ero/LibcSearcher"
license=('BSD')
depends=()
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
build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" -O1 --skip-build
}
