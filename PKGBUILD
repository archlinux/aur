# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=nixfmt
pkgver=0.4.0
pkgrel=1
pkgdesc="A formatter for Nix code "
url="https://nixfmt.serokell.io/"
license=("MPL2")
arch=('x86_64')
makedepends=('ghc' 'cabal-install')
source=("$pkgname-$pkgver.tar.gz::https://github.com/serokell/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('33b602e0537286c5b84c702c9b6304255d2279cdc4dfa3ed7f6dfa1877116e0afc7424053595c9f327b798eccae0165eca407869e9755402c539a69a68ad5296')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f cabal.project
  cabal new-update
  cabal new-build -j --enable-shared --enable-executable-dynamic --ghc-options=-dynamic --allow-newer
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m 755 -D "$(find . -name "nixfmt" -type f)" "${pkgdir}/usr/bin/nixfmt"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/nixfmt/LICENSE"
}
