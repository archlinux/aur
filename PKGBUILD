# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=libepub
pkgver=0.1.0
pkgrel=1
pkgdesc="C library for creating EPUB files"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/caskstrength/libepub"
license=('MIT')
depends=('util-linux-libs' 'undr')
makedepends=('git' 'gcc' 'make')
provides=('libepub')
conflicts=('libepub')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('74795c3b7e9db8ba2f4401916d987f461f26ac7defb5f0991fbe4af4d6de3c3e9ed42736efb3c38ebd8ec533f8d8a1a06fb6bfc1c4bb6818fa5ec2924fadbf74')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC -luuid -lundr" libepub.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/lib"

  install -m644 epub.h "${pkgdir}/usr/include/"

  install -m755 libepub.so "${pkgdir}/usr/lib/libepub.so.${pkgver}"
  ln -s "libepub.so.${pkgver}" "${pkgdir}/usr/lib/libepub.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
