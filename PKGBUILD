# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=terrapin-scanner
_name=Terrapin-Scanner
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple vulnerability scanner for the Terrapin attack'
arch=('x86_64')
url="https://github.com/RUB-NDS/${_name}"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RUB-NDS/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9f7803e6f4941514480e57f358fd0c0e64b89d165d20d5bfe8d90c34be0e38e7a3162ad5a173f50e94cfac78c63959d19c90dc79dc55b8b98cb5fd96aa4a7cd0')

prepare(){
    cd "$_name-$pkgver"
    mkdir -p build/
}

build() {
    cd "$_name-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "$_name-$pkgver"
    install -Dm755 build/$_name "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
