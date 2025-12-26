# Maintainer: Nero Blackstone <gf7600gs@gmail.com>
# Co-Maintainer: Skooma Bwoy <skooma.bwoy@keemail.me>

pkgname=numaplayer
pkgver=2.1.8
pkgrel=2
pkgdesc="Studiologic Numa Player: standalone and vst3 plugin"
arch=('x86_64')
url="https://www.studiologic-music.com/products/numaplayer"
license=('custom:proprietary')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'curl' 'gcc-libs')
source=("${pkgname}_${pkgver}_amd64.deb::https://www.studiologic-music.com/api/get-files/NumaPlayer_${pkgver}.deb")
sha256sums=('e86550e0a897f72e28743afce64a8dfb79193fbf8073f5be9676e62e227faefd')
options=('!strip')

prepare() {
    cd "$srcdir"
    bsdtar -xf "${pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.*
}

package() {
    cd "$srcdir"
    # installing binary
    install -Dm755 "usr/bin/Numa Player" "$pkgdir/usr/bin/Numa Player"
    # installing vst3
    install -dm755 "$pkgdir/usr/lib/vst3"
    cp -r "usr/lib/vst3/Numa Player.vst3" "$pkgdir/usr/lib/vst3/"
    # installing sample library
    install -dm755 "$pkgdir/usr/lib/Numa Player"
    cp -r usr/lib/Numa\ Player/* "$pkgdir/usr/lib/Numa Player/"
    # adding desktop entry
    install -Dm644 "usr/share/applications/Numa Player.desktop" \
        "$pkgdir/usr/share/applications/Numa Player.desktop"
    # adding icon
    install -Dm644 "usr/share/icons/hicolor/256x256/apps/NumaPlayer.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/NumaPlayer.png"
}
