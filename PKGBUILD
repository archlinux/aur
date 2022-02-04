# Maintainer: thebiblelover7 < ${echo "c2FuZGFkcmllbEBvdXRsb29rLmNvbQo=" | base64 -d}>

pkgname=psst-git-bin
_pkgname="psst"
pkgver=r1.1627cd4
pkgrel=1
pkgdesc="Fast and multi-platform Spotify client with native GUI"
arch=("x86_64")
url="https://github.com/jpochyla/psst"
license=('MIT')
makedepends=(
              'unzip')
provides=("psst")
conflicts=("psst" "psst-git")
source=("https://nightly.link/thebiblelover7/psst-git-bin/workflows/main/main/psst-gui.zip")
sha256sums=('SKIP')

pkgver() {
    ( curl -Lo version 'https://nightly.link/thebiblelover7/psst-git-bin/workflows/main/main/version.zip' 
    unzip -p version | cat
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
Icon=psst-gui
Terminal=false
EOF

}
