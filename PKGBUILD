# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-audioenc
pkgname=$_pkgname-git
pkgver=3.1.0.r618.f932f86
pkgrel=1
pkgdesc="Opendigitalradio DAB and DAB+ encoder"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('zeromq' 'curl' 'vlc')
makedepends=()
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
