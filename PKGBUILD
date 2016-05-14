# Maintainer: Lettier <gifcurry_aur [[@] lettier [[.]]]com>
_hkgname=Gifcurry
_licensefile=LICENSE
_ver=2.0.0.0
_xrev=0

pkgname=gifcurry
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="Create animated GIFs, overlaid with optional text, from video files."
url="https://github.com/lettier/gifcurry"
license=("Apache")
arch=("i686" "x86_64")
makedepends=("ghc=7.10.3-1" "cabal-install")
depends=("gtk3")
options=("strip" "staticlibs")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${_ver}/${_hkgname}-${_ver}.tar.gz")
sha256sums=('c6a13b6a4f1fcaf3d24428862222f52d383570eb4d5872e21cb5e2882d936809')

build() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal sandbox init
    cabal --require-sandbox update
    cabal --require-sandbox install alex -j
    cabal --require-sandbox install happy -j
    cabal --require-sandbox install gtk2hs-buildtools -j
    cabal --require-sandbox install -j --force-reinstalls --reinstall --only-dependencies
    cabal --require-sandbox configure --prefix=/usr
    cabal --require-sandbox build
}

package() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal --require-sandbox copy --destdir="$pkgdir"
}
