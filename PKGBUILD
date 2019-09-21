# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=libcvtapi-git
pkgver=r135.dae474e
pkgrel=1
pkgdesc='Official implementation of the VirusTotal API in C programming language'
arch=(i686 x86_64)
url=https://github.com/VirusTotal/c-vtapi
license=(Apache)
groups=()
depends=(curl jansson)
makedepends=(git) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(libcvtapi.so)
conflicts=(libcvtapi)
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$pkgname"
	autoreconf -fi
	./configure --disable-doxygen-doc --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
