# Maintainer: Rafal Vonau <rafal.vonau@gmail.com>
pkgname=make-3.81-static
pkgver=3.81
pkgrel=1
pkgdesc="GNU make 3.81 statically linked"
arch=('x86_64')
url="https://www.gnu.org/software/make"
license=('GPL3')
depends=()
makedepends=('docker')
source=(https://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz)
sha256sums=('16b77de9f013bcd536b7bc1efbe314223aedfe250f9063e33cbb4dfd347215a2')

build() {
    docker run --rm \
        -v "${srcdir}:/src" \
        -v "${srcdir}:/output" \
        alpine:3.18 sh -c "
            apk add --no-cache gcc musl-dev make tar &&
            cd /src/make-${pkgver} &&
            ./configure &&
            make LDFLAGS='-static' &&
            cp make /output/make-3.81-static
        "
}

package() {
    install -Dm755 "${srcdir}/make-3.81-static" "${pkgdir}/usr/bin/make-3.81"
}
