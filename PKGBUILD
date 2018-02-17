# Maintainer: Darshan Parajuli <parajulidarshan@gmail.com>
pkgbase=calc
pkgname=calc-git
_pkgname=calc
pkgver=0.1.0.r4.g3ad87c1
pkgrel=1
pkgdesc="A simple command line calculator."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/darshanparajuli/calc"
license=('MIT')
makedepends=('git' 'cargo')
source=('git+https://github.com/darshanparajuli/calc')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
	cargo build --release

	install -D -m 755 "$srcdir/$_pkgname/target/release/calc" "$pkgdir/usr/bin/calc"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/calc/LICENSE"
}
