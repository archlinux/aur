# Maintainer: Éric NICOLAS <ccjmne@gmail.com>
pkgname=par-git
pkgver=1.53.0.r0.eb0590f
pkgrel=1
pkgdesc="Adam M. Costello's paragraph reformatter, vaguely similar to fmt, but better."
arch=('x86_64')
url="http://www.nicemice.net/par/"
license=('MIT')
groups=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
options=()
install=
source=('upstream::git+https://bitbucket.org/amc-nicemice/par.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd upstream
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd upstream
  make -f protoMakefile CC="cc -c" LINK1="cc" LINK2="-o" RM="rm" JUNK="" $*
}

check() {
	cd upstream
  ./test-par ./par
}

package() {
	cd upstream
  install -D -m755 "par" "$pkgdir/usr/bin/par"
}
