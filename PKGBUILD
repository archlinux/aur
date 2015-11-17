# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=opkg-git
pkgver=v0.3.0.r35.f48bbea
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=(x86_64)
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme')
makedepends=('git')
conflicts=(opkg)
source=("git+http://git.yoctoproject.org/git/opkg#branch=opkg-0.3.x")
sha256sums=('SKIP')

pkgver() {
	cd opkg
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd opkg
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd opkg
	make
}

package() {
	cd opkg
	make DESTDIR="$pkgdir/" install
}
