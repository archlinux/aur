# Maintainer: agony <27015 at riseup dot net>

pkgname=pgstream-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='PostgreSQL replication with DDL changes (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/xataio/pgstream'
license=('Apache-2.0')
depends=('postgresql-libs')
provides=("pgstream=${pkgver}")
conflicts=('pgstream')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("pgstream-${pkgver}.linux.amd64::${_release}/pgstream.linux.amd64")
source_aarch64=("pgstream-${pkgver}.linux.arm64::${_release}/pgstream.linux.arm64")
sha256sums_x86_64=('f9da5d0c299139db5236b63bdbd5cc20f6e1267db989c51d6444f429150c158b')
sha256sums_aarch64=('cd4cca3a4b6bd705a762bfdfcd1ac99c01189ec39048d607854e1068df40f969')

build() {
  install -m755 "pgstream-${pkgver}".linux.* pgstream
  for shell in bash fish zsh; do
    ./pgstream completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 pgstream -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/pgstream"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pgstream.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pgstream"
}
