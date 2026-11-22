# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Tobias Markus < tobias AT miglix DOT eu >

pkgname=libacars
pkgver=2.2.2
pkgrel=1
pkgdesc="A library for decoding various ACARS message payloads"
arch=('x86_64' 'aarch64')
url="https://github.com/szpajder/libacars"
license=('MIT')
depends=('zlib' 'libxml2' 'jansson' 'glibc')
makedepends=('cmake')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/szpajder/libacars/archive/v$pkgver.tar.gz")
sha256sums=('f17ac4a1aa6bd0004cdcb76475e71e80c8bf228cd777ff0d11917e2b3715104e')

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
