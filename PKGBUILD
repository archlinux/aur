# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Leif Warner <abimelech@gmail.com>

pkgname=xmonad-utils
pkgver=0.1.3.3
pkgrel=2
pkgdesc='A small collection of X utilities'
url='http://hackage.haskell.org/package/xmonad-utils'
arch=('i686' 'x86_64')
license=('custom:BSD3')
depends=('gmp' 'libffi' 'libxrandr')
makedepends=('ghc' 'haskell-x11>=1.3' 'haskell-random' 'haskell-unix')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('f969a0b75107266ec5f74edc06075a1ede72857311d8e0494bf5b567d18e0a9d6e5b046dbb2a34783c2eafc18be9576b86aa78415306974718031a7dd652418c')

build() {
  cd ${pkgname}-${pkgver}
  runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
  runhaskell Setup build
}

package() {
  cd ${pkgname}-${pkgver}
  runhaskell Setup copy --destdir="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
