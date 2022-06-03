# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=nixfmt
pkgver=0.5.0 # renovate: datasource=github-tags depName=serokell/nixfmt
pkgrel=4
pkgdesc="A formatter for Nix code "
url="https://github.com/serokell/nixfmt"
license=("MPL2")
arch=('x86_64')
makedepends=('cabal-install')
depends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/serokell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('32918a990ac535731ee93630d69cf04ece641d10f0b0150b5c3f092bb3fda8a0bfc809f74a2cadf404732837743110b154ae7353b760d175769c0167f6329a8f')

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
