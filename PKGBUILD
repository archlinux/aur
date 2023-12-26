# Maintainer: Antoine Bolvy <antoine.bolvy@gmail.com> -- 2020-04-21
# Maintainer: Robert Schadek <rburners@gmail.com> 2020-04-21 --

pkgname="libpostal-git"
pkgrel=1
pkgver=v1.1.alpha.r31.g790e24bc
pkgdesc="A C library for parsing/normalizing street addresses around the world. Powered by statistical NLP and open geo data. (git version)"
arch=("any")
url="https://github.com/openvenues/${pkgname%-git}"
license=('MIT')
makedepends=('git')
depends=('curl' 'snappy' 'automake' 'autoconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/openvenues/${pkgname%-git}")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    ./bootstrap.sh
    ./configure --disable-data-download --prefix=/usr --datadir=/usr/local/share
    make
}

package() {
    ls -r
    make -C "${pkgname%-git}" DESTDIR="${pkgdir}" install
}
