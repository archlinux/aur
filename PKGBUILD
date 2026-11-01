# Maintainer: Nero Blackstone <gf7600gs@gmail.com>
# Co-Maintainer: Skooma Bwoy <skooma.bwoy@keemail.me>

pkgname=numaplayer
pkgver=2.2.5
pkgrel=1
pkgdesc="Studiologic Numa Player: standalone and vst3 plugin"
arch=('x86_64')
url="https://www.studiologic-music.com/products/numaplayer"
license=('custom:proprietary')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'curl' 'gcc-libs')
source=("${pkgname}_${pkgver}_amd64.deb::https://www.studiologic-music.com/api/get-files/NumaPlayer_${pkgver}.deb")
sha256sums=('2a900513b9459213b4819e94296d63aaa9c00bf9a526c93dbabb84a2a8fd630c')
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
