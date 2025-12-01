# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=2.0.2
pkgrel=0
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3' 'protoc-gen-js')
makedepends=('pkg-config')
source=(
  "https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz"
  "0001-fix-build-error.patch"
  "0002-fix-compatibility-with-protobuf.patch" )
sha512sums=('d2ee44f0a42863af40d9f94ef8159cdaaebd44cd4c6f6ecd69a663ddf13924c93f2d37ee32b7d3e6adef579c1ae13869333b39946c244c941bdb238aa4183e5d'
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

