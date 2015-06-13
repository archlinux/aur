# Maintainer: Andy Russell <arussell123@gmail.com>
pkgname=xmobar-volume-git
pkgver=0.23.1.r12.g1b46609
pkgrel=1
pkgdesc="A minimalistic status bar, with the volume plugin enabled."
arch=('i686' 'x86_64')
url="http://projects.haskell.org/xmobar/"
license=('custom:BSD3')
makedepends=(
  'ghc'
  'haskell-alsa-mixer'
  'haskell-http'
  'haskell-mtl'
  'haskell-parsec'
  'haskell-regex-compat'
  'haskell-stm'
  'haskell-utf8-string'
  'haskell-x11'
  'haskell-x11-xft'
  'git')
depends=(
  'alsa-lib'
  'gmp'
  'libxft'
  'libxinerama'
  'libxrandr'
  'wireless_tools')
conflicts=('xmobar' 'xmobar-darcs' 'xmobar-git')
_gitroot="https://github.com/jaor/xmobar.git"
source=("${pkgname}::git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    runhaskell Setup configure --flags="with_xft with_iwlib with_alsa" --prefix=/usr
    runhaskell Setup build
}

package() {
    cd "${pkgname}"
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 license ${pkgdir}/usr/share/licenses/$pkgname/BSD3
}
