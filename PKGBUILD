# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="hevi"
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('any')
url="https://github.com/Arnau478/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('zig')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0741eec017e37b3903727a56e0be33290884f29ac51a751e7c073d30a87c5e4c')

build() {
  cd "${srcdir}/${_pkgsrc}"
  zig build
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  zig build test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "zig-out/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "doc"
  install -Dm644 "${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}"
  install -Dm644 "${pkgname}.5.man" "${pkgdir}/usr/share/man/man5/${pkgname}"
}
