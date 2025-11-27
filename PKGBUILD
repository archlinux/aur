# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=sieveman
pkgver=0.2.1
pkgrel=1
pkgdesc="Universal ManageSieve protocol client."
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
license=('ISC')
url="https://github.com/wzykubek/sieveman"
makedepends=('go>=1.23.5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wzykubek/sieveman/archive/v${pkgver}.tar.gz")
sha256sums=('40e8d0504d1880b5218dc61a4c2356fe410d84036bb2936473bbf50d3de8d580')

prepare() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname}-${pkgver}"
    make VERSION=$pkgver
}

check() {
    cd "${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
