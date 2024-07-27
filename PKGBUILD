# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="snake-asm"
pkgver=0.4.1
pkgrel=3
pkgdesc="Terminal-based snake game written in x86_64 assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/${pkgname}"
license=('MIT')
makedepends=('make' 'nasm')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "fix_ldflags.patch")
sha256sums=('f1d4c098913db2c363c5b924f45f0a94118fa6fde511c3c8473ebd89f0200aa8'
            'b4f36aad672175334b00dc80b9d1b3d532bd1577e6cf2ab8e8193142ec833310')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/fix_ldflags.patch"
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
