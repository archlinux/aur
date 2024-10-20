# Maintainer: João Costa <joaocosta.work@posteo.net>

_pkgname=babelfish
pkgname=babelfish-fish
pkgver=1.2.0
pkgrel=3
pkgdesc="Translate bash scripts to fish"
arch=(x86_64)
url="https://github.com/bouk/babelfish"
license=("custom:MIT")
depends=("glibc")
makedepends=("go")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/bouk/babelfish/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ad3ed1fd2a680adc89ef74408ac46f0739849df2342382c1302a5de17979ec09c12416aff37abf5ccca4b2df62d80e56a4c11ead60b5944d90e5e71158687b0b')


build() {
    cd "$_pkgname-$pkgver"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "$_pkgname-$pkgver"

    install -Dvm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "babel.fish" "$pkgdir/usr/share/fish/vendor_conf.d/babel.fish"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
