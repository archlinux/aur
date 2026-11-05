# Maintainer: agony <27015 at riseup dot net>

pkgname=ryl-bin
pkgver=0.28.0
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
sha256sums_x86_64=('6e0ae1db5dc9b3b3f7c389eca845b3665eee72e3a400eea32155ccc36b27469d')
sha256sums_aarch64=('8a4d3f7ea93bd5cf96d1a1d49732869c26e7ac126e38811d6650b53d1656ccba')
sha256sums_armv7h=('d9d2db97b1681df7ee60084bbcdd8f67bf1630f93f06c78e7a2630ca87958e1d')
sha256sums_powerpc64le=('0aec2c079ff73b25e2a1a7b4980f7eca5246c4f6cf7d826c8aaa190716f5b6d8')

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
