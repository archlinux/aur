# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=mapset-verifier-bin
pkgver=1.8.2
pkgrel=3

pkgdesc="A modding tool for osu!"
arch=("x86_64")
url="https://github.com/Naxesss/MapsetVerifier"

depends=('openssl-1.1')

provides=(mapset-verifier)
conflicts=(mapset-verifier)

options=("staticlibs")

source=(
    "https://github.com/Naxesss/MapsetVerifier/releases/download/v$pkgver/mapsetverifier-$pkgver.tar.gz"
    "mapsetverifier"
    "mapsetverifier.desktop"
)

sha256sums=('bbcfd023bccf92e58615f34802175f47c36b34569e3f4c6edc09bb40217aa1e7'
            '0872d5e7eae28a979fe6472aae409ac334a138e475d96d350f6f3fe18152e113'
            '26bbe0ef4b125e240c936ca570cd8e420ec1acbef826210a73f97ddcb7aa97a1')

build()
{   
    # disable the built in updater because it always errors on linux
    sed -i "218d" "$srcdir/mapsetverifier-$pkgver/resources/app/main.js"
}

package()
{
    # add .desktop file for it to appear in the start menu
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/../mapsetverifier.desktop" "$pkgdir/usr/share/applications/mapsetverifier.desktop"

    # application icon for the start menu entry
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$srcdir/mapsetverifier-$pkgver/resources/app/assets/64x64.png" "$pkgdir/usr/share/pixmaps/mapsetverifier.png"

    # move app files to /opt/mapsetverifier
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/mapsetverifier-$pkgver" "$pkgdir/opt/mapsetverifier"

    # add launcher script to /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/../mapsetverifier" "$pkgdir/usr/bin/mapsetverifier"
}
