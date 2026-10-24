pkgname=mpatch-bin
_realver="1.8.0"
pkgver="1.8.0"
pkgrel=1
pkgdesc='Applies diffs based on context, not line numbers. Useful for AI-generated code.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Romelium/mpatch'
license=('MIT')
provides=('mpatch')
conflicts=('mpatch')
options=('!strip')

_triple_x86_64="x86_64-unknown-linux-gnu"
_triple_aarch64="aarch64-unknown-linux-gnu"
_triple_armv7h="armv7-unknown-linux-gnueabihf"

source_x86_64=("mpatch-${_realver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${_realver}/mpatch-x86_64-unknown-linux-gnu-v${_realver}.tar.gz")
source_aarch64=("mpatch-${_realver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${_realver}/mpatch-aarch64-unknown-linux-gnu-v${_realver}.tar.gz")
source_armv7h=("mpatch-${_realver}-armv7-unknown-linux-gnueabihf.tar.gz::https://github.com/Romelium/mpatch/releases/download/v${_realver}/mpatch-armv7-unknown-linux-gnueabihf-v${_realver}.tar.gz")

sha256sums_x86_64=('6378c78d5e2c4334132cdf847b3045488a3202a720a15239f12f02b628129e39')
sha256sums_aarch64=('7e8fadd7f06b8ce6b759a654d53c3721bca778bc0c378e7c9c3309349f77fe14')
sha256sums_armv7h=('c633e86fae5881d5620f8888e22f2a0494298440d6946930f5e343deef3cbf8b')

package() {
  local _dirs=( "${srcdir}"/mpatch-*-v"${_realver}" )
  if (( ${#_dirs[@]} != 1 )) || [[ ! -d "${_dirs[0]}" ]]; then
    echo "ERROR: expected exactly one mpatch-*-v${_realver} directory in ${srcdir}" >&2
    exit 1
  fi
  cd "${_dirs[0]}"

  install -Dm755 mpatch "${pkgdir}/usr/bin/mpatch"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  [[ -f README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
