# Maintainer: Julius Gonsior <aur@gaenseri.ch>
# Contributor: Julius Gonsior <aur@gaenseri.ch>

pkgname=buchhaltung-git
pkgver=20180121
pkgrel=1
pkgdesc="The ledger helper buchhaltung tool"
arch=('i686' 'x86_64')
makedepends=('git' 'stack')
url="https://johannesgerer.com/software/#buchhaltung"
license=('MIT')
options=('strip')
source=(git+https://github.com/johannesgerer/buchhaltung)
sha256sums=('SKIP')
provides=('buchhaltung')
optdepends=('aqbanking: Required for direct retrieval of bank transcations via FinTS/HBCI/EBICS (Germany) or OFXDirectConnect (USA, Canada, UK)'
'dbacl: Bayesian classifier used to match transaction to accounts. '
'hledger:  for quering the ledger, create balance and report statements, web interface, etc.')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/buchhaltung"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/bin"
  stack --local-bin-path "$pkgdir/usr/bin" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
