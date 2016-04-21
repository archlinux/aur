# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=purescript-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="A small strongly typed programming language with expressive types that compiles to Javascript, written in and inspired by Haskell."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('gmp' 'libtinfo-5' 'zlib')
makedepends=('chrpath')
provides=('purescript')
source=("purescript-${pkgver}.tar.gz::https://github.com/purescript/purescript/releases/download/v${pkgver}/linux64.tar.gz")
sha1sums=('7ac8ded4bc3e2b5af378af4bed77598eb69bfde2')

# An array doesn't seem to work with makepkg for some reason, but
# chrpath and install both support specifying multiple files at once
_binaries="psc psci psc-bundle psc-docs psc-ide-client psc-ide-server psc-publish"

package() {
  cd purescript

  chrpath -d $_binaries
  install -t "${pkgdir}/usr/bin" -D -m755 $_binaries
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
