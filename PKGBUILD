# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="miniupnpc"
pkgname="lib32-${_name}"
pkgver=2.3.3
pkgrel=1
pkgdesc="Small UPnP client library/tool to access Internet Gateway Devices (32-bit)"
arch=(
  'x86_64'
)
url="https://miniupnp.tuxfamily.org"
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
)
makedepends=(
  'lib32-gcc-libs'
  'lsb-release'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="${_name}-${pkgver}"
source=(
  "${url}/files/${_pkgsrc}.tar.gz"
  "${url}/files/${_pkgsrc}.tar.gz.sig"
)
sha512sums=('a4ac76ae4dac73773b68f4af81f8f8502d168122e16313c986b7fa7cdea02ded0e722a6dd6c8dc8633f167e04b8df1ed6f7202db0d76438c4010780c48e5594c'
            'SKIP')
b2sums=('3f20f13c5b4056be1f61dfcfc3c8a8ece65cd6377d8c2a96c2bc937932f7d084820f43f0c4a7c05f1676347c558ee6edea77df9552ed0f13232338114bd910c3'
        'SKIP')
validpgpkeys=(
  '751E9FF6944A3B36A5432216DB511043A31ACAAF' # miniupnp <miniupnp@free.fr>
)

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgsrc}"
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" LIBDIR='lib32' install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
