# Maintainer: HcgRandon <me@randon.moe>
pkgname=pokerogue-app-bin
pkgver=2.4.6d
pkgrel=4
pkgdesc="Admiral-Billy's Pokerogue App"
arch=('x86_64')
url="https://github.com/Admiral-Billy/Pokerogue-App"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/Admiral-Billy/Pokerogue-App/releases/download/v${pkgver}/PokeRogue-Linux.zip"
        "https://pokerogue.net/logo512.png"
        "pokerogue.sh"
        "pokerogue.desktop")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('395343731efaab5fdb328f7ae2023c4eeddb3f44600ddc901a8a0e2746531a4f'
            '01d67ae770ecd1d74223bd750a43ab1d22942607eb4a24fbf9ba2ba69e2e2859'
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

