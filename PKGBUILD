# Maintainer: Edward Shen <code@eddie.sh>

pkgname=holocure-bin
pkgver=0.4.1662745659
pkgrel=1
pkgdesc="A free unofficial fan game with Hololive members"
arch=('x86_64')
url=https://kay-yu.itch.io/holocure
license=('custom')
depends=(wine)
_srcurl=$(
  /usr/bin/env curl 'https://kay-yu.itch.io/holocure/file/6473479' -X POST \
  | sed -E 's/.*(https:[\/a-zA-Z0-9\.\?&=@%]*).*/\1/; s/\\//g'
)
source=(holocure holocure.desktop holocure.png "$pkgname-$pkgver.zip"::$_srcurl)
# update via updpkgsums
b2sums=('4301db2ba2d8bd5e9ccddf617c07846323b002eb5aa0e1fdc8df84e2d90d4ce7167fa0097fbcd3f159d209d1950c63afa8ac3d70a18161723566c48d69a8ee08'
        '4fd06cf2fe6796bbab41e8b473c6d558d4fc1ed71f4d87b9ed4eba720b62ffb70d4a775d28dcb1e6d4c04eadb1676c9f340344305542a62f03277f63547fcbba'
        'ede12f7c2bedcf077dd6da495f5aa2c45b95db128eb28af562b11fc13dcf21db18d98aa818b6b81514049696d9e622364d1f5044282950faa6c64499b2c613c5'
        '44a1d24e82c764cbaf7f43343d9529e458be16e3fe041bad9e61dfa617fb994635b0100d6aa719e2e0c73d9d14d09a0c885f12eb8ae4100ae098037ef337865e')
DLAGENTS=('https::/usr/bin/env curl -o %o')
options=(!strip)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/holocure" audiogroup1.dat audiogroup2.dat data.win HoloCure.exe options.ini
  install -Dm644 -t "${pkgdir}/usr/share/applications/" holocure.desktop
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" holocure.png
  install -Dm755 -t "${pkgdir}/usr/bin/" holocure
  cat > LICENSE << EOF
Video/Stream Content: Please feel free to record or stream this game however you'd like as an independent creator! 

However, you may not use this game for any direct business purposes for profit or purposes that conflict with Cover Corps' Derivative Works guidelines. 

Disclaimers: We are not affiliated with Hololive or Cover Corp. in any way. This project was made while following all guidelines under the Hololive Derivative Works guidelines (https://en.hololive.tv/terms). There is no monetization in this game. All visual and music assets used in this game are originally made for this game specifically. All sound assets are bought and paid for with the license to use commercially and non-commercially. 
EOF
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
