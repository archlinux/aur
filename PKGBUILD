# Maintainer: Daniele Bartolini <dbartolini crownengine org>

conflicts=('crown')
pkgname=crown-bin
pkgver=0.63.8
pkgrel=1
pkgdesc="A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.64.6'
         'gtk3>=3.24'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/crownengine/crown/releases/download/v$pkgver/crown-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        )
sha256sums=('75fbb5029f0f8b4427d5eeac76b42fb5fc78d552d4d8913cb507a233a2acdb91'
            '5f643f83399cfc0fb51b73e26e9080dd31b954db300868a2a2ca2734574b7113')
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
