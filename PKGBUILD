# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=terrapin-scanner
_name=Terrapin-Scanner
pkgver=1.1.3
pkgrel=1
pkgdesc='A simple vulnerability scanner for the Terrapin attack'
arch=('x86_64')
url="https://github.com/RUB-NDS/${_name}"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RUB-NDS/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4c86d076a9e449404dc3b8281c5896998f74fbdddc2f2a9f4491db72dccb9897482faf60ab2299fc8a7960c177734e20b040fb14ecc240b949b305f9ae0f8309')

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
