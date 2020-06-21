# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=nixfmt
pkgver=0.4.0
pkgrel=2
pkgdesc="A formatter for Nix code "
url="https://nixfmt.serokell.io/"
license=("MPL2")
arch=('x86_64')
makedepends=('ghc' 'cabal-install')
source=("$pkgname-$pkgver.tar.gz::https://github.com/serokell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('fbb2c7f4fe4b42cce604bc2f349fe086b34a983b4be98d256e23379b8a86007bba1b3912b35ecf92f11a6a11f6be61071dfbd95fc12f2b573df0d158943df112')

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
