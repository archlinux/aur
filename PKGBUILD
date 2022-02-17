# Maintainer: thebiblelover7 < ${echo "c2FuZGFkcmllbEBvdXRsb29rLmNvbQo=" | base64 -d}>

pkgname=psst-git-bin
_pkgname="psst"
pkgver=r1.1627cd4
pkgrel=2
pkgdesc="Fast and multi-platform Spotify client with native GUI (binary git version). github.com/thebiblelover7/psst-git-bin"
arch=("x86_64")
url="https://github.com/jpochyla/psst"
license=('MIT')
makedepends=(
              'unzip')
depends=('gtk3'
                'openssl')
provides=("psst")
conflicts=("psst" "psst-git")
source=("https://nightly.link/thebiblelover7/psst-git-bin/workflows/main/main/psst-gui.zip"
        'https://github.com/jpochyla/psst/raw/master/psst-gui/assets/logo_32.png'
        'https://github.com/jpochyla/psst/raw/master/psst-gui/assets/logo_64.png'
        'https://github.com/jpochyla/psst/raw/master/psst-gui/assets/logo_128.png'
        'https://github.com/jpochyla/psst/raw/master/psst-gui/assets/logo_256.png'
        'https://github.com/jpochyla/psst/raw/master/psst-gui/assets/logo_512.png')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    ( curl -Lo version.zip 'https://nightly.link/thebiblelover7/psst-git-bin/workflows/main/main/version.zip'
    unzip -p version.zip | cat
    )
}

prepare() {
    unzip -o psst-gui.zip
}

package() {
    # install
    install -Dm 755 psst-gui -t "${pkgdir}/usr/bin/"
    
    # desktop entry

    install -dm 755 "${pkgdir}/usr/share/applications"
    cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=Psst
Comment=Fast and multi-platform Spotify client with native GUI 
Exec=psst-gui
StartupWMClass=psst-gui
Icon=psst-gui
Terminal=false
EOF
    install -Dm644 "logo_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/psst-gui.png"
    install -Dm644 "logo_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/psst-gui.png"
    install -Dm644 "logo_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/psst-gui.png"
    install -Dm644 "logo_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/psst-gui.png"
    install -Dm644 "logo_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/psst-gui.png"

}
