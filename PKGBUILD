# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-mmbtools-common 
pkgname=$_pkgname
pkgver=1.0.r56.ge644365
pkgrel=1
pkgdesc="Opendigitalradio code test common to all ODR-mmbtools"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('zeromq')
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=()
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	mv "${pkgdir}/usr/bin/common-test" "${pkgdir}/usr/bin/mmbtools-common-test"
}
