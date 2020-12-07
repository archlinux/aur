# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=ormolu
pkgver=0.1.4.1
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${pkgname}"
license=('custom')
depends=('gmp')
makedepends=('stack')
source=("${url}/archive/${pkgver}.tar.gz"
        'stack.yaml')
sha256sums=('de36baec878120d7d4602737e7313ae82483e2817f9ed1b972da9e016be9fbcb'
            '40ff63b6c6be436d2e659c09032f4ce992a24fca713ea1f9d59d075388d62999')

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
