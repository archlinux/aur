# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-sourcecompanion
pkgname=$_pkgname-git
pkgver=1.1.0.r87.e09efac
pkgrel=1
pkgdesc="Opendigitalradio tool for connecting audio encoders to ODR-DabMux via EDI and ZeroMQ interfaces"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('zeromq' 'libfdk-aac')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git describe --tags | sed 's|-|.|g' | sed 's/v//g').r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
