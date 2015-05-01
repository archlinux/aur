# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.5.0
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('i686' 'x86_64')
url="https://github.com/joyent/http-parser"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('http-parser')
source=("$pkgname::git+https://github.com/joyent/http-parser.git#tag=v$pkgver")
md5sums=('SKIP')

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
  install -Dm644 libhttp_parser.so.$pkgver "${pkgdir}/usr/lib/libhttp_parser.so.$pkgver"
  
  ln -sf libhttp_parser.so.$pkgver "${pkgdir}/usr/lib/libhttp_parser.so.2.5"
  ln -sf libhttp_parser.so.$pkgver "${pkgdir}/usr/lib/libhttp_parser.so.2"
  ln -sf libhttp_parser.so.$pkgver "${pkgdir}/usr/lib/libhttp_parser.so"
}
