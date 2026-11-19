# Maintainer: agony <27015 at riseup dot net>

pkgname=elp-bin
pkgver=2026.11.19
_otp=otp-29.1
pkgrel=1
pkgdesc='LSP server and CLI for Erlang (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/WhatsApp/erlang-language-platform'
license=('Apache-2.0 OR MIT')
depends=('erlang-core' 'glibc' 'libgcc')
optdepends=('rebar3: rebar3 projects')
provides=("elp=${pkgver}")
conflicts=('elp')
_release="${url}/releases/download/${pkgver//./-}"
source=("elp-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/WhatsApp/erlang-language-platform/${pkgver//./-}/LICENSE-MIT")
source_x86_64=("elp-${pkgver}-${_otp}-x86_64.tar.gz::${_release}/elp-linux-x86_64-unknown-linux-gnu-${_otp}.tar.gz")
source_aarch64=("elp-${pkgver}-${_otp}-aarch64.tar.gz::${_release}/elp-linux-aarch64-unknown-linux-gnu-${_otp}.tar.gz")
sha256sums=('da6d3703ed11cbe42bd212c725957c98da23cbff1998c05fa4b3d976d1a58e93')
sha256sums_x86_64=('080e60a67bd699efc09144e5114fd91b2a252bb57c501daf1da4749683ccf25f')
sha256sums_aarch64=('9b90fa3d749a76d648ed1d341e35a33e8385c9b2a8ac0d1014b6f9328f906c98')

build() {
  for shell in bash fish zsh; do
    ./elp generate-completions "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 elp -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/elp"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/elp.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_elp"
  install -Dm644 "elp-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
