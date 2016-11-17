# Maintainer: Lettier <gifcurry_aur [[@] lettier [[.]]]com>
_hkgname=Gifcurry
_licensefile=LICENSE
_ver=2.1.0.0
_xrev=0

pkgname=gifcurry
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="Create animated GIFs, overlaid with optional text, from video files."
url="https://github.com/lettier/gifcurry"
license=("Apache")
arch=("i686" "x86_64")
makedepends=("ghc=8.0.1-1" "cabal-install")
depends=("gtk3")
options=("strip" "staticlibs")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${_ver}/${_hkgname}-${_ver}.tar.gz")
sha256sums=('51cf0949e4ea0ae9503887c0c8613d4bfee0b4bdce1d641cf0b2fd016124170c')

build() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal sandbox init
    cabal --require-sandbox update
    cabal --require-sandbox install alex -j
    cabal --require-sandbox install happy -j
    cabal --require-sandbox install gtk2hs-buildtools -j
    cabal --require-sandbox install -j --force-reinstalls --reinstall --only-dependencies
    cabal --require-sandbox configure --prefix=/usr
    cabal --require-sandbox build -j
}

package() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal --require-sandbox copy --destdir="$pkgdir"
}
