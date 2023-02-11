# Maintainer: Edward Shen <code@eddie.sh>

pkgname=holocure-bin
pkgver=0.5.1676079090
pkgrel=1
pkgdesc="A free unofficial fan game with Hololive members"
arch=('x86_64')
url=https://kay-yu.itch.io/holocure
license=('custom')
depends=(wine)
_srcurl=$(
  /usr/bin/env curl 'https://kay-yu.itch.io/holocure/file/7328041' -X POST \
  | sed -E 's/.*(https:[\/a-zA-Z0-9\.\?&=@%]*).*/\1/; s/\\//g'
)
source=(holocure holocure.desktop holocure.png "$pkgname-$pkgver.zip"::$_srcurl)
# update via updpkgsums
b2sums=('4301db2ba2d8bd5e9ccddf617c07846323b002eb5aa0e1fdc8df84e2d90d4ce7167fa0097fbcd3f159d209d1950c63afa8ac3d70a18161723566c48d69a8ee08'
        'b7260f800bf63a8f058b7df9965190583a4b3f6ad3d85aa752e5e9e8aa6f5a17742affe347ee70aee74f781657767ed9c845cbe1c48bc752cb0e7988e1532d92'
        'ede12f7c2bedcf077dd6da495f5aa2c45b95db128eb28af562b11fc13dcf21db18d98aa818b6b81514049696d9e622364d1f5044282950faa6c64499b2c613c5'
        'bef5d459591a8fa404f3fcfad5756fb4b0c43fe0ec65fef1d65d192c632afaa268222a5049873ae7824acf56e99dae02ea94a2bd23b438e033081a9fccd26593')
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
