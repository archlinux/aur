# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=2.0.1
pkgrel=0
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3' 'protoc-gen-js-bin')
makedepends=('pkg-config')
source=(
  "https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz"
  "0001-fix-build-error.patch"
  "0002-fix-compatibility-with-protobuf.patch" )
sha512sums=('7e90fce15bccb3e2e8cd75ce8bf40fff0141dc02700ef06f01e3344a49da289e1cfbd30f4f7199f08283cc78ec2d6d62154ce3ec62256a4350fe7a21657a0c14'
            '5c7c72191f41e7f4d1da6645b0e433f110f169076e97af365f1c20c7dbfb45782a1700a6ed14c180d629550918b6e86a37ccaf47f6af8f566e17b1003c8ae203'
            'c768170c7a376265348e426f871e0b0ec618c9a9d819aa296cf658a70faf73021bd3eff0aa2ecdd120c135a269b86ee74cf3f78264ba48e34da712e2344c2857')

prepare() {
    cd "grpc-web-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-fix-build-error.patch"
    patch --forward --strip=1 --input="${srcdir}/0002-fix-compatibility-with-protobuf.patch"
}
build() {
    cd "grpc-web-${pkgver}"
    make STATIC=no plugin
}

package() {
    cd "grpc-web-${pkgver}"
	install -Dm755 javascript/net/grpc/web/generator/protoc-gen-grpc-web ${pkgdir}/usr/bin/protoc-gen-grpc-web
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

