# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=Legcord
pkgname=legcord
pkgver=1.0.2
pkgrel=1
pkgdesc="Discord client with builtin client mod & theme support."
arch=('x86_64' 'aarch64')
provides=('legcord')
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
options=(!strip)

source_x86_64=(
    "$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.zip"
    "legcord.desktop"
    "legcord.png"
)
source_aarch64=(
    "$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.zip"
    "legcord.desktop"
    "legcord.png"
)
sha256sums_x86_64=('770257a252d9a031b7b8b1d762e8517272285849b050f03c76530b7950a867f9'
                   '6591a419965f775e4fceaa3e56bae05268a2427a5e2b8e7331d40d583804a001'
                   '2ac8985edf862912d42083007d1687cb6679f755b5e27ccd015d8266da51eb81')
sha256sums_aarch64=('2962030163d0cf91466b52a5ec5de5298d97ec90bd0cc21cd9493bdb260f0d3f'
                    '6591a419965f775e4fceaa3e56bae05268a2427a5e2b8e7331d40d583804a001'
                    '2ac8985edf862912d42083007d1687cb6679f755b5e27ccd015d8266da51eb81')

package() {
    rm -rf "$srcdir/$_pkgname-$pkgver-linux*.zip"

    # Move files to right directories
    install -d "$pkgdir"/opt/legcord
    cp -a "$srcdir"/* "$pkgdir"/opt/legcord

    # Set up the executables
    install -d "$pkgdir"/usr/bin
    ln -s /opt/legcord/legcord "$pkgdir"/usr/bin/legcord

    # Correct permissions
    chmod +x -R "$pkgdir"/opt/legcord/*
    chmod 755 "$pkgdir"/opt/legcord/legcord

    install -Dm644 "${srcdir}/legcord.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/legcord.png" "${pkgdir}/usr/share/pixmaps/legcord.png"
}
