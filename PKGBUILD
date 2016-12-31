# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=liquidsky
pkgver=1
pkgrel=6
pkgdesc="LiquidSky lets you instantly own and stream a powerful gaming computer to any device!"
arch=('x86_64' 'i686')
url='https://liquidsky.tv/'
depends=('wine' 'wine_gecko' 'wine-mono')
makedepends=('wget')
install=liquidsky.install
source=(
    'https://cdn.liquidsky.tv/assets/liquidsky.exe'
    'liquidsky.sh'
    'liquidsky.desktop'
)
sha256sums=(
    'SKIP'
    '4024c08f0d4faa1f15324e39e5a62a4f29e1a04c7fade0605bb4d5d265eba033'
    '8b52fd84f397717396babd540422316c3771fe1d5a9cd61c2d88bb007c0da094'
)

package() {
    mkdir -p "${pkgdir}/opt/liquidsky"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/liquidsky.exe" "${pkgdir}/opt/liquidsky/"
    install -m755 liquidsky.sh "${pkgdir}/usr/bin/liquidsky"
    install -m 644 "${srcdir}/liquidsky.desktop" "${pkgdir}/usr/share/applications/"

    for i in 16 22 24 32 48 64 128 256; do
        wget -O /tmp/liquidsky.png "https://lh3.googleusercontent.com/eEoZ7SkX46H5bdMOqqTIxMVRWQwLB42733hh8vtt0r1Q1AR4MfpUzekIvd3ZMoiFu9s1=w${i}"
        dir="${i}x${i}"
        msg2 "Icon directory: ${dir}"
        install -Dm644 /tmp/liquidsky.png "${pkgdir}/usr/share/icons/hicolor/${dir}/apps/liquidsky.png"
        rm /tmp/liquidsky.png
    done
}

