# Maintainer: gigas002 <gigas002@pm.me>

pkgname=fuzzylite-git
_pkgname=fuzzylite
pkgver=r1017.7aee562d
pkgrel=2
pkgdesc="C++ fuzzy logic control library"
arch=('x86_64')
url="https://github.com/fuzzylite/$_pkgname"
license=('GPL3')
makedepends=('cmake')
provides=("fuzzylite")
conflicts=('fuzzylite')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname/$_pkgname
    ./build.sh release
}

package() {
    install -d $pkgdir/usr/bin
    cp $srcdir/$_pkgname/$_pkgname/release/bin/$_pkgname $pkgdir/usr/bin/$_pkgname

    install -d $pkgdir/usr/lib
    # TODO: change path
    cp $srcdir/$_pkgname/$_pkgname/release/bin/lib$_pkgname.so.6.0 $pkgdir/usr/lib/lib$_pkgname.so

    install -d $pkgdir/usr/include
    mkdir $pkgdir/usr/include/fl
    cp -r $srcdir/$_pkgname/$_pkgname/fl/* $pkgdir/usr/include/fl
}
