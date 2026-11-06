# Maintainer: agony <27015 at riseup dot net>

pkgname=ryl-bin
pkgver=0.29.0
pkgrel=1
pkgdesc='Fast YAML linter and formatter (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'powerpc64le')
url='https://github.com/owenlamont/ryl'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("ryl=${pkgver}")
conflicts=('ryl')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("ryl-${pkgver}-x86_64.tar.gz::${_release}/ryl-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ryl-${pkgver}-aarch64.tar.gz::${_release}/ryl-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("ryl-${pkgver}-armv7h.tar.gz::${_release}/ryl-armv7-unknown-linux-gnueabihf.tar.gz")
source_powerpc64le=("ryl-${pkgver}-powerpc64le.tar.gz::${_release}/ryl-powerpc64le-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('143aaca73b9684ba56c19406669e0246d3fcd7e276a51998b37b288c4c3475f1')
sha256sums_aarch64=('46ec5176e24ddcfca8583daef642f5c22fddc93919dce63e59883941e4e72974')
sha256sums_armv7h=('88175f71a02df7fd1976bfb00119fc9dd5f641e04836b4543c056be6538cdc4a')
sha256sums_powerpc64le=('9c82f1fbb2f277505c7ba7e0b602a7c7c2330363244a75bd2e5ff397e1b027b6')

build() {
  for shell in bash fish zsh; do
    ./ryl --generate-completions "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 ryl -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/ryl"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ryl.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_ryl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ryl-yaml-parser/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/ryl-yaml-parser"
  install -Dm644 ryl-yaml-parser/.licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/ryl-yaml-parser/.licenses"
}
