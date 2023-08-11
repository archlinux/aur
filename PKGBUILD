# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.4.0
pkgrel=3
pkgdesc="A clone of the music game Phigros that supports custom beatmaps, multiplayer etc."
arch=('x86_64')
url="https://github.com/TeamFlos/phira"
license=('GPL3')
depends=(
    'gcc-libs'
    'bubblewrap'
)

# The reason this package depends on bubblewrap:
# Since Phira currently reads & writes its config from the dir containing itself,
# which means the permission would be a problem,
# so I used a dirty hack™: use bwrap to redirect the config dirs to user dirs.

makedepends=(
    'cargo'
    'git'
)
source=(
    "${pkgname%-bin}-v$pkgver.zip::https://github.com/TeamFlos/${pkgname%-bin}/releases/download/v$pkgver/Phira-linux-v$pkgver.zip"
    "run.sh"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.png"
)
b2sums=(
    'f70c1a067784ce7c74287a3621d5885fbcfa5edc26b60efd2985b40fc9674ef88259eea64a16e4fd090e7552cf48ef13f6ae46f37ad34b096af3836ade174c5b'
    '7fc927449a92b07235c54fe05491c8cefd967649720f5ef2260dd58b3ae50893d72dd5c152f740b746969dd3991d2db7139b7e40e42077783664e0b02dc3bcbd'
    'e370a20c1c049f99d80852c25e396e28e7595e040fd2f565ccb05e4a8f56e5ec60f3b2be6a3dee5094768418a86ebd7bcfcf5870ae40094bde11c744c4df2c32'
    'f88a9b0a83856cfe861f3b69673757464c234c9244db1619ec4fcff8d9d05c7482b5555af7f593ab16267556f8eef138699e4abe548d72ed35172e545819dc2d'
)

package() {
    # game
    install -Dm755 "${pkgname%-bin}-main" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main" # game executable
    install -Dm755 "run.sh" "$pkgdir/usr/bin/phira" # game launcher
    cp -r "assets" "$pkgdir/usr/share/${pkgname%-bin}/" # game assets
    #rm -r "$pkgdir/usr/share/${pkgname%-bin}/cache/" "$pkgdir/usr/share/${pkgname%-bin}/data/" # unneeded dirs

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"

    # desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

    # icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
    install -Dm644 "${pkgname%-bin}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
}
