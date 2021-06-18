# Maintainer: Andrea Denisse Gómez-Martínez <denisse at archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=terraform-lsp
pkgver=0.0.12
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64' 'i686')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eb51dde8bf650e7bc13ac8f75aecd0aa8f811e5f56d2f0ae8485e0a8a0fbb0a4')
sha512sums=('f84d5b4ed1207676197dd69dcaa19310ab1d8c54b9352fe9db32d0f738b4a018de9c6cbe6b6c83c0ea3393cb9cf45d0bc52bf7ab64dbebe770bdc8856b5eed3b')
b2sums=('1a5fdb12711b272fce779b68b44286595dae69d28eabd11cb2989082c1027f1ee6a9281b4143626466ccf93307bac6fa9fb696464f04e36c380e2ce67a2d9f53')
provides=($pkgname)
conflicts=($pkgname)

build() {
    cd "$pkgname-$pkgver"

    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
