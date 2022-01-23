# Maintainer: Ian Huang <imyxhuang@gmail.com>
pkgname=cardano-wallet-bin
_version=v2022-01-18
pkgver=1.33.0
pkgrel=1
pkgdesc="HTTP server & command-line for managing UTxOs and HD wallets in \
Cardano (binary package)."
arch=("x86_64")
url="https://github.com/input-output-hk/cardano-wallet"
license=("Apache")
depends=("cardano-node=${pkgver}")
provides=("cardano-wallet")
conflicts=("cardano-wallet")
source=("https://github.com/input-output-hk/cardano-wallet/releases/download/\
${_version}/cardano-wallet-${_version}-linux64.tar.gz"
  "cardano-wallet.service")
sha256sums=('fa215395af27138671dd250b7da369ad357e4487857335f1c506160b20648fbf'
            'fc6cc0c430bc8cad8ed76617cf1817540c18af508ad0602f4dfb22df61f73018')

package() {

  cd "cardano-wallet-${_version}-linux64"

  # install executable binaries EXCEPT those provided by cardano-node
  install -D -m0755 bech32 "${pkgdir}/usr/bin/bech32"
  install -D -m0755 cardano-address "${pkgdir}/usr/bin/cardano-address"
  install -D -m0755 cardano-wallet "${pkgdir}/usr/bin/cardano-wallet"

  # install systemd service
  install -D -m0644 "${srcdir}/cardano-wallet.service" \
    "${pkgdir}/usr/lib/systemd/system/cardano-wallet.service"

  # install shell completion functions
  install -D -m0644 auto-completion/bash/cardano-wallet.sh \
    "${pkgdir}/usr/share/bash-completion/completions/cardano-wallet"
  # TODO: where to put the fish and zsh completions?

}

