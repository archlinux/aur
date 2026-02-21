# Maintainer: Martin Thierer <thierer@web.de>

pkgname=unp64
pkgver=2.41
pkgrel=1
pkgdesc='Generic C64 prg unpacker'
url='http://iancoog.altervista.org/'
license=('unknown')
arch=('x86_64')
source=("http://iancoog.altervista.org/C/unp64_${pkgver/./}.7z")
md5sums=('109133f87383079d0a6e9558b424b57b')

prepare() {
  sed -Ei 's/\bCFLAGS = (.+)/CFLAGS = -std=c99 \1/' "${srcdir}/unp64_${pkgver/./}/src/Makefile"
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
