# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.25
pkgrel=2
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>0.2.0.2' 'libxft'
         'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec' 'haskell-mtl'
         'haskell-regex-base' 'haskell-regex-compat' 'haskell-http'
         'haskell-dbus' 'haskell-libmpd' 'haskell-iwlib' 'wireless_tools'
         'haskell-text')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jaor/xmobar/archive/${pkgver}.tar.gz)
sha512sums=('ca11d93d7bff9e6fd623607b25dbbd3d38c9f7b356183616d2c2050597b56b5f4636351a606d32acab232b32315f3639b78ae9f7e4385f68c810af30895c5717')

build() {
    cd xmobar-$pkgver

    runhaskell Setup configure -O \
        --enable-shared \
        --prefix=/usr \
        --enable-executable-dynamic \
        --disable-library-vanilla \
        --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_mpris with_alsa"
    runhaskell Setup build
}

package() {
    cd xmobar-$pkgver
    runhaskell Setup copy --destdir="$pkgdir"
    install -Dm 644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

