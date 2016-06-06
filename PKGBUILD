# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=purescript-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A small strongly typed programming language with expressive types that compiles to Javascript, written in and inspired by Haskell."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('gmp' 'libtinfo5' 'zlib')
makedepends=('chrpath')
provides=('purescript')
conflicts=('purescript-stack')
source=("purescript-${pkgver}.tar.gz::https://github.com/purescript/purescript/releases/download/v${pkgver}/linux64.tar.gz")
sha1sums=('9e8ff98e1e5d0dbf34df5124dc42d3b73e9dc257')

# An array doesn't seem to work with makepkg for some reason, but
# chrpath and install both support specifying multiple files at once
_binaries="psc psci psc-bundle psc-docs psc-ide-client psc-ide-server psc-publish"

package() {
  cd purescript

  install -t "${pkgdir}/usr/bin" -D -m755 $_binaries
  chrpath -d "${pkgdir}/usr/bin"/*
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
