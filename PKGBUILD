# Maintainer: wenLiangcan <boxeed at gmail dot com>

_hkgname=jinkell
pkgname=jinkell-git
pkgver=20140720
pkgrel=1
pkgdesc="jing.fm CLI client"
url="https://github.com/rnons/jinkell"
license=('Unkown')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-http' 'haskell-configurator>=0.2' 'haskell-directory>=1.1.0.0' 'haskell-haskeline>=0.7' 'haskell-jinglib-git' 'haskell-lifted-base' 'haskell-mtl' 'haskell-process' 'haskell-text>=0.11.0.5' 'haskell-transformers' 'haskell-utf8-string>=0.3')
depends=('gmp' 'mplayer')
provides=("${_hkgname}")
options=('strip')
source=("${_hkgname}"::'git://github.com/rnons/jinkell.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_hkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/${_hkgname}/${_hkgname}"
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${_hkgname} -O
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${_hkgname}/${_hkgname}"
    runhaskell Setup copy --destdir=${pkgdir}
}
