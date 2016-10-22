# Maintainer: Rober Morales-Chaparro <rober.morales@gmail.com>
pkgname=openmpi-git
pkgver=3.0.0.a1.r25968.r4a65b19
pkgrel=2
pkgdesc="High Performance Message Passing Library (MPI)"
arch=('i686' 'x86_64')
url="https://www.open-mpi.org/"
license=('BSD')
groups=()
depends=('libsystemd' 'libnl' 'numactl' 'libpciaccess')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/open-mpi/ompi.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	. VERSION
	printf "$major.$minor.$release.$greek.r%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.pl
	./configure --prefix=/usr/
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

