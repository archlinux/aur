# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=50200.2.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn-git' 'matterhorn-bin')
depends=('gmp' 'zlib')
makedepends=('cabal-install' 'ghc8.2')
source=("https://github.com/matterhorn-chat/matterhorn/archive/${pkgver}.tar.gz")
sha1sums=('2b2bdce3b239dae4a5ad3a1bde4b0b0ff6fb28fa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f cabal.project
  cabal new-update
  cabal new-build -j -w /usr/bin/ghc-8.2
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -D $(find . -name "matterhorn" -type f) "${pkgdir}"/usr/bin/matterhorn
  install -m644 -D LICENSE "${pkgdir}"/usr/share/licenses/matterhorn/LICENSE
}
