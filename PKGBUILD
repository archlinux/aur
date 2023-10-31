# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=nixfmt
pkgver=0.6.0 # renovate: datasource=github-tags depName=serokell/nixfmt
pkgrel=4
pkgdesc="A formatter for Nix code "
url="https://github.com/serokell/nixfmt"
license=("MPL2")
arch=('x86_64')
makedepends=('cabal-install')
depends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/serokell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('79abe243eec4b403a3571153f68ccbf5b3e2e342ffbe5f78318f3612ef3c073dcf5afa922276edd50a763a85463ffd617622fd2524d4fc55af7e4e8e91312325')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f cabal.project
  cabal new-update
  cabal new-build -j --enable-shared --enable-executable-dynamic --ghc-options=-dynamic --allow-newer
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib"
  install -m 755 -D "$(find . -name "nixfmt" -type f)" "${pkgdir}/usr/bin/nixfmt"
  install -m 755 -D "$(find . -name "libHSnixfmt*.so" -type f)" "${pkgdir}/usr/lib/"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/nixfmt/LICENSE"
}
