# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="snake-asm"
pkgver=0.4.1
pkgrel=3
pkgdesc="Terminal-based snake game written in x86_64 assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/${pkgname}"
license=('MIT')
makedepends=('nasm')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_fix_make_ldflags.patch")
sha256sums=('f1d4c098913db2c363c5b924f45f0a94118fa6fde511c3c8473ebd89f0200aa8'
            '4d0d7453f66ca6fe7f7a544ef17e504ef2a365ab3729067933c138d1574282a9')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${pkgname}_fix_make_ldflags.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  # unset LDFLAGS
  make 
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
