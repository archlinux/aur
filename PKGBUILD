# Maintainer: Rafal Vonau <rafal.vonau@gmail.com>
pkgname=make-4.3
pkgver=4.3
pkgrel=1
pkgdesc="GNU make 4.3 - without directory cache bug present in 4.4"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://www.gnu.org/software/make"
license=('GPL3')
depends=('glibc')
makedepends=('gcc')
source=(https://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz)
sha256sums=('e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19')

build() {
    cd make-${pkgver}
    ./configure --prefix=/usr \
                --program-suffix=-4.3 \
                --without-guile \
                --with-shipped-regex
    make
}

check() {
    cd make-${pkgver}
    make -k check
}

package() {
    cd make-${pkgver}
    make DESTDIR="${pkgdir}" install-exec
}
