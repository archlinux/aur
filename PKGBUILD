# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Julius Gonsior <aur@gaenseri.ch>

_pkgname=buchhaltung
pkgname=$_pkgname-git
pkgver=0.0.7.r2.g1a5b584
pkgrel=1
pkgdesc="Automatic import, bayesian account matching, and efficient manual entry of ledger transactions."
arch=('i686' 'x86_64')
makedepends=('git' 'stack')
url="http://johannesgerer.com/software/#buchhaltung"
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
  cd "$srcdir/$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/$_pkgname"
  
  stack --local-bin-path "$pkgdir/usr/bin" build
}

package() {
  cd "$srcdir/$_pkgname"
  stack --local-bin-path "$pkgdir/usr/bin" install

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/buchhaltung"

  find "$pkgdir" -type f -name .gitignore -delete
}
