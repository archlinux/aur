# Maintainer: Platon Pronko <platon7pronko@gmail.com>
pkgname=timescaledb-git
_name="${pkgname%-git}"
pkgver=2.0.0.beta6.r285.g9ddf375f
pkgrel=1
pkgdesc="An open-source time-series database optimized for fast ingest and complex queries."
arch=(x86_64)
url="http://www.timescale.com/"
license=(Apache)
depends=("postgresql>=9.6.0")
makedepends=(gcc git cmake)
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
    ./bootstrap -DWARNINGS_AS_ERRORS=OFF -DREGRESS_CHECKS=OFF
    cd build && make
}

package() {
    cd "$srcdir/$_name"
    cd build
    make DESTDIR="$pkgdir/" install
}
