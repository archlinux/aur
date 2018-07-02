# Maintainer: Metal A-wing <1 at 233 dot email>
# Contributor: Rocka <i at Rocka dot me>

pkgname=electron-netease-cloud-music
pkgver=0.4.3
pkgrel=1
pkgdesc="UNOFFICAL clinet for music.163.com. Powered by Electron and Vue"
arch=('x86_64')
url="https://github.com/Rocket1184/electron-netease-cloud-music"
license=('GPL-3.0')
depends=('electron')
makedepends=('asar' 'imagemagick')

#source_x86_64=('http://ncm.qn.rocka.cn/electron-ncm-linux-x64-38b3f7f.tar.gz'
source_x86_64=("https://github.com/Rocket1184/electron-netease-cloud-music/releases/download/v${pkgver}/app.asar"
  'electron-netease-cloud-music.desktop'
  'electron-netease-cloud-music.sh'
  'electron-netease-cloud-music.png'
)

md5sums_x86_64=('d6d075d2f3d861495fc0b58791a81172'
                '7f35c2dbfc5cd0fd63cd0be16cf35f3c'
                '77f597cf81b39d6d6bfee05d4009d026'
                '3d4d42071b1a86d8e3bf04e0839c3dc4')
package() {
    cd "$srcdir"

    install -Dm755 "$srcdir/electron-netease-cloud-music.sh" "$pkgdir/usr/bin/electron-netease-cloud-music"
    install -Dm644 "$srcdir/electron-netease-cloud-music.desktop" -t "$pkgdir/usr/share/applications/"
#    install -Dm644 "$srcdir/netease-cloud-music.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
    install -Dm644 ${pkgname}.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
        convert ${pkgname}.png -resize ${size}x${size} "$target/$pkgname.png"
    done


    #cd "$srcdir/${pkgname}-linux-x64"

    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    #mkdir -p "$pkgdir/usr/lib/$pkgname/"
    #cp -r --no-preserve='ownership' -- * "$pkgdir/usr/lib/$pkgname/"
    #mkdir -p "$pkgdir/usr/bin/"
    #ln -s '../lib/electron-netease-cloud-music/electron-netease-cloud-music' "$pkgdir/usr/bin/electron-netease-cloud-music"


    asar e "$srcdir/app.asar" app
    install -Dm644 "$srcdir/app/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/app.asar" -t "$pkgdir/usr/lib/$pkgname/"
}

