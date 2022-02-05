# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-padenc
pkgname=$_pkgname-git
pkgver=3.0.0.r231.49e5d8b
pkgrel=1
pkgdesc="Opendigitalradio Programme Associated Data (PAD) encoder"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('imagemagick')
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
