# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=crex
pkgver=0.2.5
pkgrel=2
pkgdesc='Explore, test, and check regular expressions in the terminal'
arch=('x86_64')
url='https://octobanana.com/software/crex'
license=('MIT')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/octobanana/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c6a166b7a1e696a7babeaf7c5728eece1624704a18357f827129fc95ef2ecc56')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
