# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=minisat-git
pkgver=2.2.1.r3.gf7d16b9
pkgrel=1
pkgdesc='A minimalistic and high-performance SAT solver (git version)'
arch=('i686' 'x86_64')
url="http://minisat.se/"
license=('MIT')
conflicts=('minisat')
makedepends=('git')
source=($pkgname::git+https://github.com/msoos/minisat)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's|^releases/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make config prefix=/usr
    make
}

package() {
    make -C "$srcdir/$pkgname" install DESTDIR="$pkgdir"
}

# vim:set ts=4 sts=4 sw=4 et:
