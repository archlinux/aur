# Maintainer: Daniele Bartolini <dbartolini crownengine org>

conflicts=('crown')
pkgname=crown-bin
pkgver=0.64.2
pkgrel=2
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
sha256sums=('962b05aa3a4982b1749c14f7b63548c9c7d1e07ded34ca1d02c83cdcb3bc3f65'
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
