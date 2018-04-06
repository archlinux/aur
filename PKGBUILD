# Maintainer: Neil Shepperd <nshepperd at gmail dot com>
pkgname=cabal-static
pkgver=2.0.0.1
pkgrel=3
pkgdesc="The command-line interface for Cabal and Hackage. Statically linked."
arch=('i686' 'x86_64' 'armv7h')
url="https://hackage.haskell.org/package/cabal-install"
license=('custom:BSD3')
depends=('gmp' 'zlib' 'libffi')
makedepends=('ghc' 'ghc-static')
provides=(cabal-install)
conflicts=(cabal-install)
source=("https://hackage.haskell.org/package/cabal-install-${pkgver}/cabal-install-${pkgver}.tar.gz")
md5sums=('9b0ed71c792418545e4779907c12e0bb')

build() {
  cd "${srcdir}/cabal-install-$pkgver"

  ./bootstrap.sh --sandbox
}

package() {
  cd "${srcdir}/cabal-install-$pkgver"

  install -Dm755 .cabal-sandbox/bin/cabal \
          "${pkgdir}/usr/bin/cabal"
  gzip -c .cabal-sandbox/share/man/man1/cabal.1 \
       > .cabal-sandbox/share/man/man1/cabal.1.gz
  install -Dm644 .cabal-sandbox/share/man/man1/cabal.1.gz \
          "${pkgdir}/usr/share/man/man1/cabal.1.gz"

  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 bash-completion/cabal \
          "${pkgdir}/usr/share/bash-completion/completions/cabal"
}
