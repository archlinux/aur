# Maintaner: Evan Overman <evanrileyoverman@gmail.com>

pkgname=simplest-fetch-git
_pkgname=simplest-fetch
pkgver=1.0.0.r1.gaff5a4d
pkgrel=1
pkgdesc="The simplest fetch program you'll ever find, written in C."
url='https://github.com/an-prata/simplest-fetch'
makedepends=('git' 'gcc')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	./build.sh
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/usr/bin/
	mv build/simplest-fetch ${pkgdir}/usr/bin/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
