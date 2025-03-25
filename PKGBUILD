# Mantainer: Davide Berardi <berardi.dav@gmail.com>

_pkgname="cado"
pkgname="$_pkgname-git"
pkgver=r54.5aba888
pkgrel=1
pkgdesc="Capability DO (like a sudo providing users with just the
capabilities they need))"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/rd235/$_pkgname"
license=('GPL')
groups=('virtualsquare')
depends=('libcap' 'pam' 'mhash' 's2argv-execs-git')
makedepends=('make' 'cmake' 'git')
provides=("cado=$pkgver" "caprint=$pkgver")
conflicts=('cado' 'caprint')
source=("git+$url.git")
install="cado-git.install"
md5sums=('SKIP')

pkgver() {
        cd "$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_BUILD_TYPE=release    \
		..
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
