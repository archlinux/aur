# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=freeserf
_pkgname=FreeSerf
pkgver=0.3
pkgrel=2
pkgdesc="Opensource Settlers 1 clone (requires original game file)"
arch=('i686' 'x86_64')
url="http://jonls.dk/freeserf/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_image')
makedepends=('cmake' 'libxmp')
optdepends=('libxmp: Amiga audio playback')
install=freeserf.install
source=(${pkgname}-${pkgver}.tar.xz::"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${_pkgname}.tar.xz"
        "cstdint.patch")
md5sums=('956fa204197ec29d688b0fbfbb50bd93'
         '98a869d79db05db90d22bf69cdba159d')
sha1sums=('24913d2716eff5d71b08a3de8439750d4db627c3'
          'a451fc22da6d2d7754ddb7f6437d96e99d03df46')

prepare() {
  mkdir ${_pkgname}/build

  # Fix cstdint bustage, remove once fixed upstream
  # https://github.com/freeserf/freeserf/pull/526
  cd ${_pkgname}
  patch -p1 -i "${srcdir}/cstdint.patch"
}

build() {
  cd ${_pkgname}/build
  cmake -DCMAKE_BUILD_TYPE="None" -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd ${_pkgname}/build
  install -Dm755 src/FreeSerf "${pkgdir}/usr/bin/freeserf"
}
