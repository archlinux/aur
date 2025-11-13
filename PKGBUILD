# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Tobias Markus < tobias AT miglix DOT eu >

pkgname=libacars
pkgver=2.2.1
pkgrel=1
pkgdesc="A library for decoding various ACARS message payloads"
arch=('x86_64' 'aarch64')
url="https://github.com/szpajder/libacars"
license=('MIT')
depends=('zlib' 'libxml2' 'jansson' 'glibc')
makedepends=('cmake')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/szpajder/libacars/archive/v$pkgver.tar.gz")
sha256sums=('94b1669ce73f085494fb768a02aab8ac0f4e52704759269b9c526637aa6db7d9')

build() {
    cd "$srcdir"

    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build \
        -S "$pkgname-$pkgver" \
        -Wno-dev \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    make -C build
}

package() {
    cd "$srcdir"

    make -C build install DESTDIR="$pkgdir"

    install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:expandtab
