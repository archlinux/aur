# Maintainer: Daniele Bartolini <dbartolini.aa gmail com> - https://github.com/dbartolini

replaces=('pepper')
pkgname=crown
pkgver=0.42.0
pkgrel=1
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/dbartolini/crown"
license=('MIT')
depends=('glib2>=2.48.2'
         'gtk3>=3.16'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/dbartolini/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        "crown.desktop"
        "icons.tar.gz"
        )
sha256sums=('469d2115381b559dddac1b364c9a2bffc068cfcacbede70ae6fec22dd2a7d9e2'
            'a03e46e40bf1a08aecb97dfea2d22e3f7b61ab906a3f24e329a98fd6fb1a9b1d'
            'e8950a977117d524b56c5103126938430d787dbada535c9efaba266666ad3624')

package() {
    install -d "$pkgdir"/opt
    cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname

    # Launcher
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown"

    # License
    install -D -m644 $pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons
    install -D -m644 crown.desktop "${pkgdir}/usr/share/applications/crown.desktop"
    for _res in 512x512 256x256 128x128 64x64 48x48 32x32 16x16; do
        install -D -m644 $pkgname/icons/$_res/apps/crown.png "${pkgdir}/usr/share/icons/hicolor/$_res/apps/"
    done
    install -D -m644 $pkgname/icons/crown.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
