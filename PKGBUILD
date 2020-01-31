# Mantainer: Davide Berardi <berardi.dav@gmail.com>

pkgname=cado-git
_gitname=cado
pkgver=0.9.2
pkgrel=5

pkgdesc="Capability DO (like a sudo providing users with just the
capabilities they need))"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/rd235/cado"
license=('GPL')
makedepends=('make' 'cmake' 'git')
depends=('libcap' 'pam' 'mhash' 's2argv-execs-git')
provides=('cado' 'caprint')
conflicts=('cado' 'caprint')
source=("git://github.com/rd235/cado.git" "cado-0.9.2-arch.patch")
install="cado-git.install"
md5sums=('SKIP' '387d5a7653e8b9fb08823f56b8e04b13')

build() {
	cd "$srcdir/$_gitname"
	patch -p1 < ../../cado-0.9.2-arch.patch
	mkdir -p build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX="/usr" ..
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir/" install
}

