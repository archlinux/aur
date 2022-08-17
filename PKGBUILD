# Maintainer: Derzsi Daniel <daniel@tohka.us>
pkgname="antique-penguin-launcher"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="A launcher for Antique Penguin"
arch=("any")
makedepends=("yarn" "git")
license=("LGPL")
source=("git+https://github.com/darktohka/antique-penguin-client.git")
sha256sums=("SKIP")
options=(!strip)

build() {
    cd "${srcdir}/antique-penguin-client"

    # Build application
    yarn install
    yarn dist

    # Create desktop entry
    cat << EOF > "${srcdir}/antique-penguin-client/antique-penguin-launcher.desktop"
[Desktop Entry]
Type=Application
Name=Antique Penguin
Comment=A moderated virtual remake of Club Penguin where anyone can play games, have fun and interact with others.
Icon=/usr/share/pixmaps/antique-penguin-launcher.png
Exec=/usr/bin/antique-penguin-launcher
Terminal=false
Categories=Game
EOF
}

package() {
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications"

    # Install AppImage
    install -Dm755 "${srcdir}/antique-penguin-client/dist/antique.AppImage" "${pkgdir}/usr/bin/antique-penguin-launcher"

    # Install icon
    install -Dm644 "${srcdir}/antique-penguin-client/lib/img/icon.png" "${pkgdir}/usr/share/pixmaps/antique-penguin-launcher.png"

    # Install desktop entry
    install -Dm644 "${srcdir}/antique-penguin-client/antique-penguin-launcher.desktop" "${pkgdir}/usr/share/applications/antique-penguin-launcher.desktop"
}
