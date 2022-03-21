# Maintainer: Kai Muenz <kai+archlinux@muenz.net>

_pkgname=odr-dabmux
pkgname=$_pkgname-git
pkgver=4.1.0.r0.g88d3542
pkgrel=1
pkgdesc="Opendigitalradio DAB multiplexer"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=()
depends=('zeromq' 'boost-libs')
makedepends=('boost')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	./bootstrap.sh
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
