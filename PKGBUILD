# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=haskeme
pkgver=0.1.0.1.57d5a8f
pkgrel=1
pkgdesc='Compiler from I- to S-Expressions for the Scheme Programming Language'
url='https://github.com/jumper149/haskeme'
license=('custom:BSD3')
arch=('x86_64')
depends=( )
makedepends=('ghc')
conflicts=( )
provides=( )
source=('git+https://github.com/jumper149/haskeme.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  baseV="$(grep "^version:" "haskeme.cabal" | cut --delimiter=":" --fields=2 | sed -e "s/ //g")"
  gitV="$(git rev-parse --short HEAD)"
  echo "${baseV}.${gitV}"
}

build() {
  cd "${pkgname}"
  runhaskell "Setup" configure -O \
    --enable-shared \
    --prefix=/usr \
    --enable-executable-dynamic \
    --disable-library-vanilla
  runhaskell "Setup" build
}

package() {
  cd ${pkgname}
  runhaskell "Setup" copy --destdir="${pkgdir}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
