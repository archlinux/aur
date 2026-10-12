pkgname=mpatch-bin
_realver="1.7.0"
pkgver="1.7.0"
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

sha256sums_x86_64=('68544763d3c32d98a79c57c24833e17c50074114ee19002354779174a1ffed30')
sha256sums_aarch64=('03765031bc512ca8f0290c242144f12f282fa37eba49b387ea72b9e7c2a2a6cf')
sha256sums_armv7h=('b5c1e2cda2fb93fd5f2a95477a667c33f26832a478b41423703bdb3b914490c1')

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
