# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=Odin

pkgname=odin
pkgver=0.13.0
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
depends=('llvm' 'clang')
provides=('odin')
conflicts=('odin')
source=(
  "https://github.com/odin-lang/Odin/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'ae88c4dcbb8fdf37f51abc701d94fb4b2a8270f65be71063e0f85a321d54cdf0'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}/"
  make release
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  cd "${srcdir}/${_srcname}-${pkgver}/"

  cp odin "${pkgdir}/usr/lib/${pkgname}/odin"
  cp -r core "${pkgdir}/usr/lib/${pkgname}/core"

  ln -s "/usr/lib/${pkgname}/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 PROPOSAL-PROCESS.md "${pkgdir}/usr/share/doc/${pkgname}/PROPOSAL-PROCESS.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
