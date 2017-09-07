# Maintainer: Benoît Zugmeyer <bzugmeyer@gmail.com>
pkgname=timescaledb-git
_name="${pkgname%-git}"
pkgver=0.4.2
pkgrel=1
pkgdesc="An open-source time-series database optimized for fast ingest and complex queries."
arch=(x86_64)
url="http://www.timescale.com/"
license=(Apache)
depends=("postgresql>=9.6.0")
makedepends=(git)
provides=("$_name")
conflicts=("$_name")
install="${_name}.install"
source=("$_name::git+https://github.com/timescale/timescaledb#branch=master")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_name"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_name"
    make
}

package() {
    cd "$srcdir/$_name"
    make DESTDIR="$pkgdir/" install
}
