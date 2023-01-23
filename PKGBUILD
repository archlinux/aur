# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
pkgname=mecab-ipadic-git
_pkgname=mecab
pkgrel=2
pkgver=r154.046fa78
pkgdesc="Yet another Japanese morphological analyzer (IPADIC dictionary)"
arch=('i686' 'x86_64')
url="https://taku910.github.io/mecab"
depends=('mecab')
makedepends=('git')
conflicts=('mecab-ipadic')
provides=('mecab-ipadic')
license=('GPL2')
source=("git+https://github.com/taku910/mecab.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}/mecab-ipadic"
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-charset=utf-8
	make
}

check() {
	cd "${_pkgname}/mecab-ipadic"
	make -k check
}

package() {
	cd "${_pkgname}/mecab-ipadic"
	make DESTDIR="$pkgdir/" install
}
