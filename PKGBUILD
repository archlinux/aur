# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=pepecoin
pkgver='1.1.0'
pkgrel=1
pkgdesc="The world's first fully decentralized and secure blockchain for Pepe."
arch=('x86_64')
url='https://github.com/pepecoinppc/pepecoin'
license=('MIT')
depends=('abseil-cpp' 'boost-libs' 'db5.3' 'gcc-libs' 'glibc' 'libevent' 'openssl' 'protobuf' 'qrencode' 'qt5-base')
makedepends=('boost' 'git' 'qt5-tools')
source=("${pkgname}-${pkgver}::git+https://github.com/pepecoinppc/pepecoin.git#tag=v${pkgver}"
        'use-c++17.patch')
b2sums=('7c0ce6b1e00bbe422fd4e2726b1bb079d570c7304f778a84e828eece9755c67a6bfe2fc05847352fd175ed4d81a2fcee1b1ccf148a35ca73e8c146d246132e92'
        '903a27f9b2233b7c54fad227d7f9657fbdf354fd187558cf2d7f7c7479132dfe1ffee29bc6ae4f72a98742d9902a8fa1ff822754db078961c69b412db946c671')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../use-c++17.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh

  ./configure --prefix=/usr

  make -j$(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
