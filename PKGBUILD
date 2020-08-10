# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=libsubhook
pkgver=0.7
pkgrel=2
pkgdesc='Simple hooking library for C and C++'
arch=('x86_64')
makedepends=('cmake')
url='https://github.com/Zeex/subhook'
license=('BSD')
options=('staticlibs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d89e2db9f6e485beb2a0d6f7baae1808f1bc47708142dd089dc64015abb605c6')

build() {
  cd "${srcdir}/subhook-${pkgver}"
  mkdir -p build && cd build
  cmake -DSUBHOOK_TESTS=0 -DSUBHOOK_STATIC=0 ..
  make
  cmake -DSUBHOOK_TESTS=0 -DSUBHOOK_STATIC=1 ..
  make
}

package() {
  cd "${srcdir}/subhook-${pkgver}"
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/include"
  install -Dm644 build/libsubhook.{so,a} "${pkgdir}/usr/lib"
  install -Dm644 subhook.h "${pkgdir}/usr/include"
}
