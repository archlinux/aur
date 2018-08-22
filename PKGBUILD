# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.27
pkgrel=1
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>0.2.0.2' 'libxft'
         'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec'
         'haskell-parsec-numbers' 'haskell-mtl' 'haskell-regex-base'
         'haskell-regex-compat' 'haskell-http' 'haskell-dbus' 'haskell-libmpd'
         'haskell-iwlib' 'wireless_tools' 'haskell-text')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jaor/xmobar/archive/${pkgver}.tar.gz)
sha512sums=('ad235a81dd59a972646c189500b665c9c18d3ca644c9fa4bc18f6f1004e1e6914b6b5f3e83db439b946efd622bbf4d0894eb84fcf521255916f095632d8249da')

build() {
    cd xmobar-$pkgver

    runhaskell setup configure -O \
        --enable-shared \
        --prefix=/usr \
        --enable-executable-dynamic \
        --disable-library-vanilla \
        --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_mpris with_alsa"
    runhaskell setup build
}

package() {
    cd xmobar-$pkgver
    runhaskell setup copy --destdir="$pkgdir"
    install -Dm 644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

