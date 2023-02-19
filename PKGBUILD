# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=hex2dfu-git
pkgver=r27.472b703
pkgrel=1
pkgdesc="Simple command line tool to convert file format from Intel HEX to STM32 DFU."
url="https://github.com/encedo/hex2dfu"
depends=(glibc)
makedepends=(git)
license=('MIT')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/encedo/hex2dfu.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  gcc -DED25519_SUPPORT=0 hex2dfu.c -o hex2dfu
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 hex2dfu "${pkgdir}/usr/bin/hex2dfu"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/hex2dfu/README.md"
}

# vim:set ts=2 sw=2 et:
