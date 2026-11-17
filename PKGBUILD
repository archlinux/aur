# Maintainer: agony <27015 at riseup dot net>

pkgname=ryl-bin
pkgver=0.30.0
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
sha256sums_x86_64=('37ee3c236005117886949cb413b467a9f4ec06072e2233a1727222b06e54ea3e')
sha256sums_aarch64=('2e4a765434d63986c858678df0573349da44abc162b7b698a4395e5b586a1e10')
sha256sums_armv7h=('06d8d81109a60b5ceb7fb212ad7a47549ffd7679fc921ee1877399e03527fdef')
sha256sums_powerpc64le=('8d23545d924ed82343cda27ea8ba7ab9093af261796a0b1fcb01261c246ad9fb')

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
