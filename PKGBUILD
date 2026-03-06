# Maintainer: Rafal Vonau <rafal.vonau@gmail.com>
pkgname=make-4.2.1-static
pkgver=4.2.1
pkgrel=1
pkgdesc="GNU make 4.2.1 statically linked"
arch=('x86_64')
url="https://www.gnu.org/software/make"
license=('GPL3')
depends=()
makedepends=('docker')
source=(https://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz)
sha256sums=('e40b8f018c1da64edd1cc9a6fce5fa63b2e707e404e20cad91fbae337c98a5b7')

build() {
    docker run --rm \
        -v "${srcdir}:/src" \
        -v "${srcdir}:/output" \
        alpine:3.18 sh -c "
            apk add --no-cache gcc musl-dev make tar &&
            cd /src/make-${pkgver} &&
            ./configure &&
            make LDFLAGS='-static' &&
            cp make /output/make-4.2.1-static
        "
}

package() {
    install -Dm755 "${srcdir}/make-4.2.1-static" "${pkgdir}/usr/bin/make-4.2.1"
}
