# Mantainer: Davide Berardi <berardi.dav@gmail.com>

pkgname=cado-git
_gitname=cado
pkgver=0.9.2
pkgrel=1

pkgdesc="Capability DO (like a sudo providing users with just the
capabilities they need))"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/rd235/cado"
license=('GPL')
makedepends=('autoconf' 'git')
depends=('libcap' 'pam' 'mhash' 'libs2argv-execs-git')
provides=('cado' 'caprint')
conflicts=('cado' 'caprint')
source=("git://github.com/rd235/cado.git" "cado-0.9.2-arch.patch")
install="cado-git.install"
md5sums=('SKIP' 'ab1dffca550b1b771e74d35c9ced400c')

build() {
	cd "$srcdir/$_gitname"
	patch -p1 < ../../cado-0.9.2-arch.patch
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}

