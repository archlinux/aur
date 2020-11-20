# Mantainer: Davide Berardi <berardi.dav@gmail.com>

pkgname=cado-git
_gitname=cado
pkgver=0.9.5
pkgrel=1

pkgdesc="Capability DO (like a sudo providing users with just the
capabilities they need))"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/rd235/cado"
license=('GPL')
makedepends=('make' 'cmake' 'git')
depends=('libcap' 'pam' 'mhash' 's2argv-execs-git')
provides=('cado' 'caprint')
conflicts=('cado' 'caprint')
source=("git://github.com/rd235/cado.git")
install="cado-git.install"
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_BUILD_TYPE=release    \
		..
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir/" install
}

