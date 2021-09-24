# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=ormolu
pkgver=0.3.0.1
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${pkgname}"
license=('custom')
depends=('gmp')
makedepends=('stack')
source=("${url}/archive/${pkgver}.tar.gz"
        'stack.yaml')
sha256sums=('2e8b126bc65b1912e6bacefc3243bbb3503ddfd3a8aeb0709774a61893b32f24'
            '3b3c1499c535905e83e168052a1dec1b084829dc7832a9aaa3150aba251dae88')

prepare() {
  mv stack.yaml "${pkgname}-${pkgver}/"
}

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
