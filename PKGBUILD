# Maintainer: Seraph_JACK <seraphjack@outlook.com>
pkgname=anni-ws-gui-git
pkgver="1.0.0"
pkgrel=1
pkgdesc="Anni workspace GUI."
arch=('x86_64')
url="https://github.com/ProjectAnni/anni-workspace-gui"
license=('Apache')
makedepends=(
    git
    npm
)
depends=(
    libxrandr
    libxkbcommon
    glibc
    libxcomposite
    cairo
    at-spi2-core
    alsa-lib
    libxext
    gtk3
    libxfixes
    dbus
    libxcb
    libx11
    nss
    libdrm
    nspr
    pango
    libxdamage
    libcups
    gcc-libs
    expat
    bash
    mesa
    glib2
)
provides=("anni-ws-gui")
conflicts=("anni-ws-gui")

source=(
    "anni-ws-gui::git+https://github.com/ProjectAnni/anni-workspace-gui.git"
    "anni-ws-gui.sh"
    "anni-ws-gui.desktop"
    "anni-ws-gui.png"
)

sha256sums=('SKIP'
            '0deccddab5a9dc403b1fa95d1a554df300edf7e5cad7e771b4b71224d58141c7'
            '7ccace643c75bf18bc5d64514a1c4d3c4dd9dc98d589a54796db7fea0d71bc8e'
            '4363016ccf3541c84ae6a1eee83f507fb2b775aa89b9d6c8163875640267f9e9')

build() {
    cd "${srcdir}/anni-ws-gui"
    npm install
    npm run build:linux
}

package() {
    # Libraries
    cd "${srcdir}/anni-ws-gui"
    mkdir -p "${pkgdir}/usr/lib/anni-ws-gui"
    cp -r dist/linux-unpacked/* "${pkgdir}/usr/lib/anni-ws-gui"

    # Binaries
    install -D -m755 "${srcdir}/anni-ws-gui.sh" "${pkgdir}/usr/bin/anni-ws-gui"

    # Desktop launcher with icon
    install -Dm644 "${srcdir}/anni-ws-gui.desktop" "${pkgdir}/usr/share/applications/anni-ws-gui.desktop"
    install -Dm644 "${srcdir}/anni-ws-gui.png" "${pkgdir}/usr/share/pixmaps/anni-ws-gui.png"
}
