# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="river-tag-overlay"
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for the river Wayland compositor showing tag status"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~leon_plickat/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'pixman'
  'river'
  'wayland'
)
_pkgsrc="${url##*/}-v${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
b2sums=('ed7b003a46698da3fc857e7d1ad6204f2c7627bc63145b7b71e736e623b07c763c862598c7039a0bfe4937bf43ba86e2cbdef8dd4c66c2be147c502c17d71386')

build() {
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"

  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} $(pkg-config --cflags pixman-1)"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
