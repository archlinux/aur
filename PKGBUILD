# Maintainer: Your Name <your email>

pkgname=pretticy
pkgver=0.1.0
pkgrel=1
pkgdesc="C library for formatting and prettify JSON, XML and HTML strings"
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/pretticy"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('pretticy')
conflicts=('pretticy')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('559d2903f9f119b703d155030c865e8b757bf2e4acacea3fbe166fdfcde5a53a')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -O2 -g -std=c23 -Iinclude -fPIC" build/libpretticy.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/lib"

  install -m644 include/*.h "${pkgdir}/usr/include/"

  install -m755 build/libpretticy.so "${pkgdir}/usr/lib/"

  # 3. Install the License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
