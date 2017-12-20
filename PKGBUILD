# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ripple-ledger
pkgdesc='Ripple wallet GUI for the Ledger Hardware Wallet'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-wallet-ripple'
pkgver=1.0.3
pkgrel=1
options=('!strip')
arch=('x86_64')
deb_package="ledger_wallet_ripple_x64_${pkgver}.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(0da4d3571b21e0bb72608624d6aed9c53c484f5e10f61375505220813139bab1)

install=ripple-ledger.install

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

