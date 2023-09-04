# Maintainer: Martin Thierer <thierer@web.de>

pkgname=unp64
pkgver=2.37
pkgrel=2
pkgdesc='Generic C64 prg unpacker'
url='http://iancoog.altervista.org/'
license=('unknown')
arch=('x86_64')
source=(
  "http://iancoog.altervista.org/C/unp64_${pkgver/./}.7z"
  "ul-args-parse.patch"
)
md5sums=('00c54d72da1b6ab27b1b6f6193608d4e'
         '967a5c268d71151d42c57c73e8bb7412')

prepare() {
  echo $(pwd)
  patch -Np1 -d "unp64_${pkgver/./}" -i ../ul-args-parse.patch
}

build() {
  cd "${srcdir}/unp64_${pkgver/./}/src"

  make
}

package() {
  cd "${srcdir}/unp64_${pkgver/./}"

  install -D -m755 -t ${pkgdir}/usr/bin/ src/Release/unp64
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ unp64.txt
}
