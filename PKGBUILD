# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-dabmux
pkgname=$_pkgname-git
pkgver=v2.3.1
pkgrel=1
pkgdesc="Opendigitalradio DAB multiplexer"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/ODR-DabMux"
license=('GPL')
groups=()
depends=('zeromq' 'boost-libs')
makedepends=('boost')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Opendigitalradio/ODR-DabMux.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
	cd "$_pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
