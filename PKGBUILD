# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=liquidsky
pkgver=2
pkgrel=1
pkgdesc="LiquidSky lets you instantly own and stream a powerful gaming computer to any device!"
arch=('x86_64' 'i686')
url='https://liquidsky.tv/'
depends=('wine' 'wine_gecko' 'wine-mono' 'winetricks')
install=liquidsky.install
source=(
    'https://cdn.liquidsky.com/assets/LiquidSkyClient.exe'
    'liquidsky.sh'
    'liquidsky.desktop'
)
sha256sums=(
    'SKIP'
    '8eb1fd2011b5433bbd096974cf6c830eeff785d0e192e67a9dd38473adb0447e'
    '8b52fd84f397717396babd540422316c3771fe1d5a9cd61c2d88bb007c0da094'
)

package() {
    mkdir -p "${pkgdir}/opt/liquidsky"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/LiquidSkyClient.exe" "${pkgdir}/opt/liquidsky/"
    install -m755 liquidsky.sh "${pkgdir}/usr/bin/liquidsky"
    install -m 644 "${srcdir}/liquidsky.desktop" "${pkgdir}/usr/share/applications/"

    for i in 16 22 24 32 48 64 128 256; do
        wget -O /tmp/liquidsky.png "https://lh3.googleusercontent.com/ebmqQZPl9kGpYOxD4yZcm3wzdB9VL2pqeCjnA8Ew9TFna5uXw-9pRjavlW3vgw6YAz_w=w${i}"
        install -Dm644 /tmp/liquidsky.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/liquidsky.png"
        rm /tmp/liquidsky.png
    done
}

