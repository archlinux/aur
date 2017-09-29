# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.24.5
pkgrel=3
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>0.2.0.2' 'libxft'
         'libxinerama' 'wireless_tools' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri' 'haskell-hinotify'
         'haskell-stm' 'haskell-parsec' 'haskell-mtl' 'haskell-regex-base'
         'haskell-regex-compat' 'haskell-http' 'haskell-dbus' 'haskell-libmpd')
makedepends=('ghc')
source=(https://hackage.haskell.org/packages/archive/xmobar/$pkgver/xmobar-$pkgver.tar.gz)
sha512sums=('b7f4c8b206640d7d0fc60e326fffdc31f4c00df0ffac86102d40035bc632c808cfa19485073059a9c9a01c45b7a9e0aa2bba8dfa27ce9df79d1247a3a13073d4')

build() {
    cd xmobar-$pkgver

    runhaskell Setup configure -O \
        --enable-shared \
        --prefix=/usr \
        --enable-executable-dynamic \
        --disable-library-vanilla \
        --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_alsa"
    runhaskell Setup build
}

package() {
    cd xmobar-$pkgver
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

