# Maintainer: czyt <czytcn@gmail.com>

pkgname=tgrep-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="Trigram-indexed grep with a client/server architecture for fast local regex search in large codebases"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/tgrep"
license=('MIT')
makedepends=('libarchive')
provides=("tgrep=${pkgver}")
conflicts=('tgrep')
options=('!strip' '!debug')

_archive_x86_64="tgrep-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
_archive_aarch64="tgrep-v${pkgver}-aarch64-unknown-linux-musl.tar.gz"
source=("tgrep-${pkgver}-LICENSE::https://raw.githubusercontent.com/microsoft/tgrep/v${pkgver}/LICENSE")
source_x86_64=("${_archive_x86_64}::${url}/releases/download/v${pkgver}/${_archive_x86_64}")
source_aarch64=("${_archive_aarch64}::${url}/releases/download/v${pkgver}/${_archive_aarch64}")
sha256sums=('5baa259ffd1a975780869d7d2925212224c92206cefb96fb2bf0b146650e5029')
sha256sums_x86_64=('956a561524fcf9c5cc7631b99218b4d6f2e9845aae51a698aee275fdc23fd6a0')
sha256sums_aarch64=('7cc452df81a671949e692b471ee7dd2df01e2ebfb2ce38669388703cd14a0880')
noextract=("${_archive_x86_64}" "${_archive_aarch64}")

package() {
  local archive_var="_archive_${CARCH}"
  local archive="${!archive_var}"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc/${pkgname}"
  bsdtar -xOf "${srcdir}/${archive}" ./tgrep > "${pkgdir}/usr/bin/tgrep" || return 1
  chmod 755 "${pkgdir}/usr/bin/tgrep"
  bsdtar -xOf "${srcdir}/${archive}" ./README.md > "${pkgdir}/usr/share/doc/${pkgname}/README.md" || return 1
  chmod 644 "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/tgrep-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
