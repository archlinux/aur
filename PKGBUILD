# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=1.5.0
pkgrel=0
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3')
makedepends=('pkg-config')
source=("https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz" "0001-fix-build-error.patch")
sha512sums=('c92180686af250d7b791fd9b0a127f09952cd75ae22224bdd0f9bd134c9c1a3f90e3d91b5f5d6d0ad9236ccef97da317b7010395e6fb7146f50dd91a094de37a'
            '1b1c0cc0d97a991129a3bf3a9b42d9758630abb88faa05f02dc479ddb64d1d9b002dba692506b913680de143aa210958717de2f469d15be4e3ead3d66a1f8c50')

prepare() {
    cd "grpc-web-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-fix-build-error.patch"
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

