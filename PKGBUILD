# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Phira is a clone of the music game Phigros that supports custom beatmaps, multiplayer etc."
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
source=("${pkgname%-bin}-v$pkgver.zip::https://github.com/TeamFlos/${pkgname%-bin}/releases/download/v$pkgver/Phira-linux-v$pkgver.zip" "run.sh")
b2sums=('f70c1a067784ce7c74287a3621d5885fbcfa5edc26b60efd2985b40fc9674ef88259eea64a16e4fd090e7552cf48ef13f6ae46f37ad34b096af3836ade174c5b' '7fc927449a92b07235c54fe05491c8cefd967649720f5ef2260dd58b3ae50893d72dd5c152f740b746969dd3991d2db7139b7e40e42077783664e0b02dc3bcbd')

package() {
  install -Dm755 "${pkgname%-bin}-main" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main"
  install -Dm755 "run.sh" "$pkgdir/usr/bin/phira"
  cp -r "assets" "$pkgdir/usr/share/${pkgname%-bin}/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
