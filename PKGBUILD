# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=xpid
pkgname=(xpid)
pkgver=v1.0.1
pkgrel=1
pkgdesc="Linux process discovery. Its like nmap -- for pids."
arch=(x86_64)
url="https://github.com/kris-nova/xpid"
license=(MIT)
makedepends=(go make clang cmake)
checkdepends=()
optdepends=()
backup=()
options=()
source=("git+https://github.com/kris-nova/xpid.git")
sha256sums=('SKIP')
build() {
	cd $pkgname
	git checkout tags/$pkgver -b $pkgver
	GO111MODULE=on
	go mod vendor
	go mod download
	make clean
	make libxpid
	make libxpid-install
	make
}

package() {
	cd $pkgname
	make install
}
