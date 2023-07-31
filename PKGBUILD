# Maintainer: Daniele Bartolini <dbartolini crownengine org>

replaces=('pepper')
pkgname=crown
pkgver=0.48.0
pkgrel=1
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.48.2'
         'gtk3>=3.16'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/crownengine/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        "crown.desktop"
        "icons.tar.gz"
        )
sha256sums=('39a4b78a66a587280909f3745a4bcf7948b1beb76596a7e8e810e8b8a4ac4e24'
            '0c4170cc61e5f802763ab335dcc151a0dcf421c21e624225d28ce025fe666a91'
            'e8950a977117d524b56c5103126938430d787dbada535c9efaba266666ad3624'
            '375b5408a928ed0b752c43f9cb52209a81223f788ae26f991987bcb4341f5847')

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
        install -D -m644 icons/$_res/apps/crown.png "${pkgdir}/usr/share/icons/hicolor/$_res/apps/crown.png"
    done
    install -D -m644 icons/crown.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/crown.svg"
}
