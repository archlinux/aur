# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=babelfish
pkgname=babelfish-fish
pkgver=1.1.0
pkgrel=2
pkgdesc="Translate bash scripts to fish"
arch=(x86_64)
url="https://github.com/bouk/babelfish"
license=("custom:MIT")
depends=("glibc")
makedepends=("go")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/bouk/babelfish/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('26090a43f329a33c4e3d757475fbc5cd5ffe18975bf3c2e7a0b8f5f7c036ea23a32a3583f5d53ea91f6997d050305878c97114eda14485964e73f96782fe601b')


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
