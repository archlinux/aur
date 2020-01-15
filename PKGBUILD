# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=ormolu
pkgver=0.0.3.0
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${pkgname}"
license=('custom')
depends=('gmp')
makedepends=('stack')
source=("${url}/archive/${pkgver}.tar.gz"
        'stack.yaml')
sha256sums=('59eccef466353f85ab40cd76c1dd5a7e87598e27c7db798a741c5c8aba1d635b'
            'b924a2de0804fefa9b513cd7e790fb41e0b178742ee7e78c82e3ae64deb26a76')

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
