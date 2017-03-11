# Maintainer Dhananjay B <mail@dbalan.in>

pkgname=tarsnap-backup-git
pkgver=0.2.ge9bba7b
pkgrel=1
pkgdesc="Haskell program for managing tarsnap backups"
arch=('x86_64')
url="https://github.com/irv/tarsnap-backup"
license=('custom:BSD3')
makedepends=(
  'ghc'
  'git'
  'cabal-install'
  'haskell-cmdargs'
)
provides=('tarsnap-backup')
depends=('tarsnap')

_gitroot="https://github.com/irv/tarsnap-backup.git"
source=("${pkgname}::git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
 cd "${pkgname}"
 echo 0.2.g$(git rev-parse HEAD | head -c 7)
}

build() {
 cd "${pkgname}"
 cabal configure
 cabal build
}

package() {
 cd "${pkgname}"
 install -D -m755 dist/build/tarsnap-backup/tarsnap-backup  "${pkgdir}/usr/bin/tarsnap-backup"
 install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
