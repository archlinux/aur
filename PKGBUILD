# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Alim Gokkaya <alimgokkaya@gmail.com>
# Contributor: Seth Girvan <snth@snthhacks.com>

pkgname=librdkafka-git
pkgver=2.12.1.r1.616fb6e
pkgrel=1
pkgdesc='The Apache Kafka C/C++ library'
arch=(x86_64)
url='https://github.com/confluentinc/librdkafka'
license=(
    'BSD-2-Clause'
    'Apache-2.0'
    'BSD-2-Clause'
    'BSD-3-Clause'
    'MIT'
    'Zlib'
)
depends=(
    'curl'
    'gcc-libs'
    'glibc'
    'libsasl'
    'lz4'
    'openssl'
    'zlib'
    'zstd'
)
makedepends=(
    'git'
    'python'
    'rapidjson'
)
conflicts=('librdkafka')
provides=("${pkgname%-git}=${pkgver}")
source=("${pkgname%-git}::git+$url.git")
changelog="CHANGELOG.md"
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}" || exit
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${pkgname%-git}" || exit
    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname%-git}" || exit
    make -k check
}

package() {
    cd "${pkgname%-git}" || exit
    make DESTDIR="$pkgdir" install
    install -vDm644 README.md -t "$pkgdir/usr/share/${pkgname%-git}/"
    install -vDm644 CONFIGURATION.md -t "$pkgdir/usr/share/${pkgname%-git}/"
}
