# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=noise-suppression-for-voice
pkgver=0.9
pkgrel=1
pkgdesc="A real-time noise suppression plugin for voice"
arch=('x86_64')
url="https://github.com/werman/noise-suppression-for-voice"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz"
        "headers.patch")
sha256sums=('db42eb863082847ce58eeb9395eaaa7ccd84a0dd7153c35a614f35dd0967aab1'
            'e565b6fe5cdede167fea0aed145ce51e17953313a4648ec51e8f63687c8752bf')
sha512sums=('eaeea0842b467adc73d55bbbc9146b88dddafd80c227f51514152aaac25cebd0febe2a2577669525cd39706e6c2a28d9195313d53f12739c904ac4c78d11ca1f'
            '63eee80770b497e9c2d2e09298e5084d7712084cdf775676b1764882d04fe7ba168a9af930f12873539270a01c6adc8d8ca23e65a516b53ad9e18e090319d062')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir build
  patch -p1 -i "${srcdir}/headers.patch"
}

build() {
  cd ${pkgname}-${pkgver}/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=None ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
