# Contributor: Thor K. Høgås <thor at roht.no>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=50200.7.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn-git' 'matterhorn-bin')
depends=('gmp' 'zlib')
makedepends=('cabal-install' 'ghc')
source=("https://github.com/matterhorn-chat/matterhorn/archive/${pkgver}.tar.gz")
sha1sums=('e7abdea2cdbcbf1a115409f27d1686a0084eeafc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f cabal.project
  cabal new-update
  cabal new-build -j --enable-shared --enable-executable-dynamic --ghc-options=-dynamic
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -D $(find . -name "matterhorn" -type f) "${pkgdir}"/usr/bin/matterhorn
  install -m644 -D LICENSE "${pkgdir}"/usr/share/licenses/matterhorn/LICENSE
}
