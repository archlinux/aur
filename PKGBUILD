# Mantainer: MCMic <come@chilliet.eu>

# PKGBUILD options/directives
pkgname=intricacy
pkgver=0.6.2
pkgrel=1
pkgdesc="A game of competitive puzzle-design"
url="http://mbays.freeshell.org/intricacy"
license=("GPL-3")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-sdl' 'haskell-sdl-gfx' 'haskell-sdl-ttf' 'haskell-network-fancy' 'haskell-cryptohash' 'haskell-mtl' 'haskell-safe' 'haskell-stm' 'haskell-vector')
options=('strip')
source=("http://sdf.org/~mbays/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("dce6907980d4b3e9eace2e4e5f5192459992a365d12d2c22860ff1afe2ffb5c7")

# PKGBUILD functions

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    runhaskell Setup configure -O --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        -f-server -fgame -fcurses -fsdl
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    runhaskell Setup copy --destdir="${pkgdir}"
}
