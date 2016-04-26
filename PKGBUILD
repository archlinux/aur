# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif-git
_pkgname=FLIF
pkgver=r567.db62345
pkgrel=1
pkgdesc="Free Lossless Image Format"
arch=("i686" "x86_64")
url="https://github.com/FLIF-hub/FLIF"
license=('GPL3')
conflicts=('flif')
depends=('zlib' 'libpng' 'sdl2')
makedepends=('git')
source=('git+https://github.com/FLIF-hub/FLIF.git')
sha256sums=('SKIP')


pkgver() {
      cd "$srcdir/${_pkgname}"
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}/src"
  make all
  make decoder
}

package() {
  cd "$srcdir/${_pkgname}/src"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/"
  install -dm755 "${pkgdir}/usr/share/man/man1/"
  install -dm755 "${pkgdir}/usr/include/${_pkgname}"
  install -m755 flif viewflif dflif "${pkgdir}/usr/bin"
  install -m755 libflif_dec.so "${pkgdir}/usr/lib/"
  install -m755 libflif.so "${pkgdir}/usr/lib/"
  install -m 644 library/*.h "${pkgdir}/usr/include/${_pkgname}"
  install -m 644 ../doc/flif.1 "${pkgdir}/usr/share/man/man1"
  install -m 755 ../tools/gif2flif "${pkgdir}/usr/bin"
  install -m 755 ../tools/apng2flif "${pkgdir}/usr/bin"
  cd "$srcdir/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
