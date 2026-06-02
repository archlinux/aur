# Maintainer: rendogust <rendogust@gmail.com>
# Contributor: romelium

pkgname=mpatch-bin
pkgver=1.6.4
pkgrel=1
pkgdesc='Applies diffs based on context, not line numbers. Useful for AI-generated code.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Romelium/mpatch'
license=('MIT')
provides=('mpatch')
conflicts=('mpatch')

# Upstream target triples per architecture
# Arch uses glibc, so we use the gnu triples (not musl)
_triple_x86_64="x86_64-unknown-linux-gnu"
_triple_aarch64="aarch64-unknown-linux-gnu"
_triple_armv7h="armv7-unknown-linux-gnueabihf"

source_x86_64=("mpatch-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${pkgver}/mpatch-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz")
source_aarch64=("mpatch-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${pkgver}/mpatch-aarch64-unknown-linux-gnu-v${pkgver}.tar.gz")
source_armv7h=("mpatch-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${pkgver}/mpatch-armv7-unknown-linux-gnueabihf-v${pkgver}.tar.gz")

sha256sums_x86_64=('014e71cf1bde4018612880b974c87d9a521c614ba81d4048a8a49a9aaf1f256d')
sha256sums_aarch64=('22221734249916cd4438e8646d4f2dca2aa8f1435b62906ad08853187a8aee41')
sha256sums_armv7h=('fb2a8f8f1c520e53b5422db99f45a7b7592948e21f30cdb193ec9f4fb8543c87')

package() {
  # Determine the triple from the source URL that was actually downloaded
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
    armv7h)  _triple="${_triple_armv7h}" ;;
  esac

  cd "${srcdir}/mpatch-${_triple}-v${pkgver}"

  install -Dm755 mpatch "${pkgdir}/usr/bin/mpatch"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
