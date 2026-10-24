pkgname=mpatch-bin
_realver="1.8.1"
pkgver="1.8.1"
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

sha256sums_x86_64=('2e011ee85f8b56694b3216aceff010045896f96b7d84d6991f3cf53a8f5c7f4f')
sha256sums_aarch64=('5cf1c6a25cb061a435c117d4bf2cfe5afaeca6f1c688ef0194ff3f1854539413')
sha256sums_armv7h=('18ef21e2e7b0d054c69a6b6537afd6fa1db313a11bc71be76a8ca0bc873c293b')

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
