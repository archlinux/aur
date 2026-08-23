# Maintainer: Daniele Bartolini <dbartolini crownengine org>

conflicts=('crown')
pkgname=crown-bin
pkgver=0.64.4
pkgrel=1
pkgdesc="A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.64.6'
         'gtk3>=3.24'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/crownengine/crown/releases/download/v$pkgver/crown-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        )
sha256sums=('0bc6a296ff39eecd2c70f79ce278f30782209a8c74b787291a2d7ce04e9d0145'
            'a3623e9786261ab6d15e1a07091b2117d2d9cd4d25176209a42392ba512dfe08')
options=('!strip')

package() {
    install -d "$pkgdir"/opt
    cp -r crown-$pkgver-linux-x64 $pkgdir/opt/crown

    # Launcher.
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown"

    # License.
    install -D -m644 crown-$pkgver-linux-x64/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons.
    install -D -m644 crown-$pkgver-linux-x64/org.crownengine.Crown.desktop "${pkgdir}/usr/share/applications/org.crownengine.Crown.desktop"
    install -D -m644 crown-$pkgver-linux-x64/org.crownengine.Crown.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.crownengine.Crown.svg"
}
