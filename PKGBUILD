# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=mapset-verifier-bin
pkgver=1.7.2
pkgrel=1

pkgdesc="A modding tool for osu!"
arch=("x86_64")
url="https://github.com/Naxesss/MapsetVerifier"

provides=(mapset-verifier)
conflicts=(mapset-verifier)

options=("staticlibs")

source=(
    "https://github.com/Naxesss/MapsetVerifier/releases/download/v$pkgver/mapsetverifier-$pkgver.tar.gz"
    "mapsetverifier"
    "mapsetverifier.desktop"
)

sha256sums=('e500c90b36dff036d3bec843a4988584e5a94ab86d1e20e017380e8b23ab3ae9'
            'e4f3c0303ff1092c541246f542509fa1147059c7978f287d3147d0e1a89b4bce'
            '26bbe0ef4b125e240c936ca570cd8e420ec1acbef826210a73f97ddcb7aa97a1')

build()
{   
    # extract the tar.gz
    tar xzf "mapsetverifier-$pkgver.tar.gz"

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
