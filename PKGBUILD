# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=corepack
pkgver=0.11.2
pkgrel=1
pkgdesc="Zero-runtime-dependency package acting as bridge between Node projects and their package managers."
arch=(
  'any'
)
url="https://github.com/nodejs/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
provides=('corepack')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b98db09123d8c7007240a4a83e79d4200f30f3c95c99e2a9f9ba50339e8e4d2f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn install
  yarn build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a dist/** "$pkgdir/usr/lib/$pkgname/"
  chmod +x "${pkgdir}/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}

# vim:set sw=2 sts=-1 et:
