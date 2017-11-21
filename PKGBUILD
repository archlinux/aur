# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ripple-ledger
pkgdesc='Ripple wallet GUI for the Ledger Hardware Wallet'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-wallet-ripple'
pkgver=1.0.2
pkgrel=1
options=('!strip')
arch=('x86_64')
deb_package="ledger_wallet_ripple_linux_x64.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(59fd8f2a3028bd4d34fe9093c4ac9048c3153e0acf5d13f19ab2628d98c3d416)

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

