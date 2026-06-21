# Maintainer: HcgRandon <me@randon.moe>
pkgname=pokerogue-app-bin
pkgver=2.4.6e
pkgrel=2
pkgdesc="Admiral-Billy's Pokerogue App"
arch=('x86_64')
url="https://github.com/Admiral-Billy/Pokerogue-App"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/Admiral-Billy/Pokerogue-App/releases/download/v${pkgver}/PokeRogue-Linux.zip"
        "https://pokerogue.net/logo512.png"
        "pokerogue.sh"
        "pokerogue.desktop")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('538f0692c57f65159e333470f0339855ca7f3132c67724934e2f2a3c25ed4207'
            '7232f79a44cf8ed446807b679de09f3bdf03cc565cb4c10481abba4749331381'
            '003155b0691d4222c72dc4d24f398b849690d073938cbd05e38ca0a9bd5ad83c'
            '116c567e84c8a3cfa46fb6d0bad12e63d808a5d3056c6d66867707d200dba7c7')

build() {
    cd "$srcdir"
    mkdir -p pokerogue
    bsdtar -xf "${pkgname}-${pkgver}.zip" -C pokerogue
}

package() {
    cd "$srcdir/pokerogue"
    
    # Create the install directory
    install -dm755 "$pkgdir/usr/share/pokerogue"

    # Copy all files to the target directory
    cp -r ./* "$pkgdir/usr/share/pokerogue/"

    # Install launcher script
    install -Dm755 "$srcdir/pokerogue.sh" "$pkgdir/usr/bin/pokerogue"

    # Install the .desktop file
    install -Dm644 "$srcdir/pokerogue.desktop" "$pkgdir/usr/share/applications/pokerogue.desktop"

    # Install icon
    install -Dm644 "$srcdir/logo512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pokerogue.png"
}

