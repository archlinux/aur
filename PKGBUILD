# Maintainer:  Leah Anderson <leah@chromebooks.lol>

_binname="dtk"
pkgname="decomp-toolkit"
pkgver=1.8.0
pkgrel=1
pkgdesc="A GameCube & Wii decompilation toolkit"
arch=('aarch64' 'x86_64')
url="https://github.com/encounter/${pkgname}"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('44b3016a8aac2d6e34215236de664a08175903821b00ca3a06a2611788bc7b0b08f85ad0ab574b24b676202d3f747257a8de12484de6cb4774c9c40ed86fd25a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  cargo build --release
}
package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
}
