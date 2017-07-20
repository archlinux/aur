# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=liquidsky
pkgver=2
pkgrel=11
pkgdesc="LiquidSky lets you instantly own and stream a powerful gaming computer to any device!"
arch=('x86_64' 'i686')
url='https://liquidsky.tv/'
depends=('wine' 'wine_gecko' 'wine-mono' 'winetricks' 'lib32-vulkan-icd-loader' 'lib32-vulkan-validation-layers'
         'vulkan-extra-layers' 'vulkan-headers' 'vulkan-icd-loader' 'vulkan-intel' 'vulkan-validation-layers' 'samba')
makedepends=('wget')
install=liquidsky.install
source=(
    'https://cdn.liquidsky.com/assets/LiquidSkyClient.exe'
    'liquidsky.sh'
    'liquidsky.desktop'
)
sha256sums=(
    'SKIP'
    'aded9d60ec3ba4fba6c6c096b5dfed22f7c27448f89658fedca0827290f7cfb7'
    'd3354f08697806b7034c24377c528bc2b4c1db23a27bc424deda5d0a7869e7e9'
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
