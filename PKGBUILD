# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser-git
pkgver=2.3.r4.g158dd3b
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('i686' 'x86_64')
url="https://github.com/joyent/http-parser"
license=('MIT')
depends=('glibc')
makedepends=('git')
conflicts=('http-parser')
provides=('http-parser')
source=("$pkgname::git+https://github.com/joyent/http-parser.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/^[a-z]*-?//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make library
}

package() {
  cd $pkgname

  install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 AUTHORS \
        "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 http_parser.h "${pkgdir}/usr/include/http_parser.h"
  install -Dm644 libhttp_parser.so.2.3 "${pkgdir}/usr/lib/libhttp_parser.so.2.3"
  
  ln -sf libhttp_parser.so.2.3 "${pkgdir}/usr/lib/libhttp_parser.so.2"
  ln -sf libhttp_parser.so.2.3 "${pkgdir}/usr/lib/libhttp_parser.so"
}
