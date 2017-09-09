# Maintainer: Lettier <gifcurry_aur a@@at@t lettier dd.ot..t ccommm>

_hkgname=Gifcurry
_licensefile=LICENSE
_ver=2.1.1.0
_xrev=0

pkgname=gifcurry
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="Open source video to GIF maker that allows overlaid text."
url="https://github.com/lettier/gifcurry"
license=("Apache")
arch=("i686" "x86_64")
makedepends=("ghc=8.0.2-3" "cabal-install")
depends=("gtk3")
options=("strip" "staticlibs")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${_ver}/${_hkgname}-${_ver}.tar.gz")
sha256sums=('19b77a63824d671d660c57a49033aac9a9c13287920592bb50871481128cc1b3')

build() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal sandbox init
    cabal --require-sandbox update
    cabal --require-sandbox install alex -j
    cabal --require-sandbox install happy -j
    cabal --require-sandbox install gtk2hs-buildtools==0.13.2.2 -j
    cabal --require-sandbox install -j --force-reinstalls --reinstall --only-dependencies
    cabal --require-sandbox configure --prefix=/usr
    cabal --require-sandbox build -j
}

package() {
    cd "${srcdir}/${_hkgname}-${_ver}"
    cabal --require-sandbox copy --destdir="$pkgdir"
}
