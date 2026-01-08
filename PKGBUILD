# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: lucasm < luluco250 at gmail dot com >
# Contributor: normal < marlon at kern dot earth >
# Contributor: Mr.Smith1974

_basename=fallout2-ce
pkgname=$_basename-game
pkgver=1.3.0
pkgrel=5
pkgdesc='Fallout 2 for modern operating systems'
arch=('any')
url="https://github.com/alexbatalov/$_basename"
license=('custom:SUL')
depends=('sdl2')
makedepends=('cmake')
source=(
    "$_basename-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
    '2fcb58dd77eb025ac7a0a8f36699241e2303f9a7078ba563a3bfd424cbeb804a'
)

build() {
    cd "$srcdir/$_basename-$pkgver" || exit 1
    cmake -S . -B build \
        -DCMAKE_C_STANDARD="17" \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-incompatible-pointer-types" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    cd "$srcdir/$_basename-$pkgver" || exit 1
    install -Dm755 "build/$_basename" "$pkgdir/usr/bin/$_basename"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

