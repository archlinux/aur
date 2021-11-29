# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=scratch-desktop
pkgver=3.26.0
pkgrel=3
pkgdesc="Create and share your own interactive stories, games, music and art"
url="https://scratch.mit.edu"
arch=('x86_64')
license=('GPL')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'minizip' 'nss' 're2' 'snappy')
makedepends=('electron11')
source=('https://downloads.scratch.mit.edu/desktop/Scratch%203.26.0%20Setup.exe'
        'https://scratch.mit.edu/images/download/icon.png'
        'scratch-desktop.desktop'
        'x-scratch.xml'
)
sha256sums=('7ecbd1ea6561601574b2a8bca71a145b4ee98f8983e37193dabaa4c5e48b5725'
            '5efbe1a31e973d0393631e0317f68f81d213b6c55434b9f9185a47554f23ed99'
            '73d4f255aee28b9f72764a55e8711d07826e037ec624d23c8f7e7764c10475d5'
            '1090a96c91f7a47801633e077717b730d636f53bac7f8958c9fc9595ee5dba7e')

build() {
    cp -rf /usr/lib/electron11/* .
    rm $srcdir/*.dll
    rm $srcdir/*.exe
    ln -fsr electron scratch-desktop
}

package() {
    install -d ${pkgdir}/usr/lib/scratch-desktop
    cp -rf locales/ resources/ swiftshader/ ${pkgdir}/usr/lib/scratch-desktop
    cp lib* ${pkgdir}/usr/lib/scratch-desktop
    cp *.pak *.bin *.dat *.json ${pkgdir}/usr/lib/scratch-desktop
    cp chrome-sandbox electron version ${pkgdir}/usr/lib/scratch-desktop
    ln -sf electron ${pkgdir}/usr/lib/scratch-desktop/scratch-desktop

    install -d ${pkgdir}/usr/share/licenses/scratch-desktop
    cp LICENSE* ${pkgdir}/usr/share/licenses/scratch-desktop

    install -d ${pkgdir}/usr/bin
    ln -sf /usr/lib/scratch-desktop/scratch-desktop ${pkgdir}/usr/bin/scratch-desktop

    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/scratch-desktop.png
    install -Dm644 resources/static/assets/0fb9be3e8397c983338cb71dc84d0b25.svg ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/scratch-sprite.svg

    install -Dm644 scratch-desktop.desktop ${pkgdir}/usr/share/applications/scratch-desktop.desktop

    install -Dm644 x-scratch.xml ${pkgdir}/usr/share/mime/packages/x-scratch.xml
}
