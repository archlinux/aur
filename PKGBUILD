# Maintainer: agony <27015 at riseup dot net>

pkgname=pgstream-bin
pkgver=1.5.0
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
sha256sums_x86_64=('80cb61cf3a218ec0a94f5f98d7c8015f7fdacb700910f0474cba8dde9f9b8ad5')
sha256sums_aarch64=('cfad86d75b92d4a30af2e7d5f6c805f27df749034473291b3c83387be856fa6f')

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
