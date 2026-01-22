# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="wat"
pkgver=1.0.0
pkgrel=1
pkgdesc="Get Wayland xdg-activation tokens"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~leon_plickat/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'wayland'
)
_pkgsrc="${url##*/}-v${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
b2sums=('efa37ffed947c8e5f3a1fb0e4fc1749f31851b98ab8d7e2b88761512b9f435782f8c260433cc3c2d6a84b389bd3c3ff4d2948db71ea347bfa7eb04d3b81d2803')

build() {
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"

  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
