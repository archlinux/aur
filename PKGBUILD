# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ripple-ledger-bin
pkgdesc='Ripple wallet GUI for the Ledger Hardware Wallet'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-wallet-ripple'
pkgver=1.1.1
pkgrel=1
conflicts=('ripple-ledger')
options=('!strip')
arch=('x86_64')
deb_package="ledger_wallet_ripple_linux_x64_${pkgver}.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(6e3ce86ef9a4c4998a3d86394baa09e9b4e485cf202b1959fb685344ae76158f)

install=ripple-ledger-bin.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"
  chmod 755 -R "$pkgdir/usr"
}

