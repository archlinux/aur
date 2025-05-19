# Maintainer: wyf9661 <wyf9661 at gmail.com>
# Contributor: go-zero team <@kevwanzero>

pkgname=go-zero
pkgver=1.8.3
pkgrel=1
pkgdesc="A cloud-native Go microservices framework with cli tool for productivity."
arch=(any)
url="https://github.com/zeromicro/go-zero"
license=(MIT)
depends=('glibc' 'go' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc')
makedepends=('upx')
makeoptions=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('b9e354ecfdf87e71f65b047076d22209b3a13fb3')
provides=('go-zero' 'goctl')

build() {
    cd "$pkgname-$pkgver"/tools/goctl && make
}

package() {
    install -dm755 "$pkgdir/usr/bin/"
    install -Dm755 $pkgname-$pkgver/tools/goctl/goctl -t "$pkgdir/usr/bin/"

    install -Dm644 $pkgname-$pkgver/{readme,SECURITY,CONTRIBUTING}.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
