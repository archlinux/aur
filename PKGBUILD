# Maintainer: Julius Gonsior <aur@gaenseri.ch>
# Contributor: Julius Gonsior <aur@gaenseri.ch>

pkgname=buchhaltung-git
pkgver=0.0.5.r34.g4c5832f
pkgrel=1
pkgdesc="Automatic import, bayesian account matching, and efficient manual entry of ledger transactions."
arch=('i686' 'x86_64')
makedepends=('git' 'stack')
url="https://johannesgerer.com/software/#buchhaltung"
license=('MIT')
source=(git+https://github.com/johannesgerer/buchhaltung)
sha256sums=('SKIP')
provides=('buchhaltung')
conflicts=('buchhaltung')

optdepends=(
    'aqbanking: Required for direct retrieval of bank transcations'
    'dbacl: Bayesian classifier used to match transaction to accounts. '
    'hledger:  for quering the ledger, create balance and report statements, web interface, etc.')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  
  stack --local-bin-path "$pkgdir/usr/bin" build
}

package() {
  cd ${pkgname%-git}
  stack --local-bin-path "$pkgdir/usr/bin" install

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/buchhaltung"

  find "$pkgdir" -type f -name .gitignore -delete
}
