# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=num
pkgver=r312.9aa9e49
pkgrel=1
pkgdesc="a command line tool for mathematics and statistics data processing"
arch=('i686' 'x86_64')
url="http://www.numcommand.com"
license=('MIT')

depends=('glibc')
makedepends=('gcc' 'make')

source=('git://github.com/numcommand/num.git')
md5sums=('SKIP')

pkgver() {
  cd num
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/num/implementations/num-c"
  gcc -Wall -O3 -march=native -mtune=native num.c -o num -lm
  strip num
}

package() {
  cd "${srcdir}/num"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 implementations/num-c/num "${pkgdir}/usr/bin/num"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
