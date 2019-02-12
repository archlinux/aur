# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-dabmod
pkgname=$_pkgname-git
pkgver=v2.3.0
pkgrel=1
pkgdesc="Opendigitalradio DAB modulator"
arch=('x86_64' 'i686' 'armv7h' 'aarch64') 
url="https://github.com/Opendigitalradio/ODR-DabMod"
license=('GPL')
groups=()
depends=('zeromq' 'boost-libs' 'libuhd')
makedepends=('boost')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Opendigitalradio/ODR-DabMod.git")
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
