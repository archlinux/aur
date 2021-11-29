# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=ormolu
pkgver=0.4.0.0
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${pkgname}"
license=('custom')
depends=('gmp')
makedepends=('stack')
source=("${url}/archive/${pkgver}.tar.gz"
        'stack.yaml')
sha256sums=('c87b2e09cef54aa7568b9bc990bb6ffd7b8dae3d8b950557fbe60ec286039353'
            '8b473464fa93da60396c74177d5a2fb7d9295686a89ed803b8a6650cdb8fb67d')

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
