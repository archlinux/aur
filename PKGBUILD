# Maintainer: Evilleader <evilleader91@gmail.com>
pkgname=gameflow-deck-git
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool for managing games on your deck"
arch=('x86_64')
url="https://github.com/simeonradivoev/gameflow-deck"
license=('MIT')
depends=('nodejs' 'bun' 'nwjs' 'chromium' 'sqlite')
makedepends=('git' 'bun')
provides=('gameflow-deck')
conflicts=('gameflow-deck')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "gameflow-deck"
    bun install
    bun run build:prod:vite
}

package() {
    # 1. Create the destination directory
    install -d "${pkgdir}/opt/gameflow-deck"

    # 2. Copy your built files from the source to the system
    # (Adjust 'dist' to whatever folder your build process creates)
    cp -r gameflow-deck/dist/* "${pkgdir}/opt/gameflow-deck/"

    # 3. Install your desktop entry (as you did before)
    install -d "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/gameflow.desktop"
[Desktop Entry]
Name=Gameflow
Exec=/opt/gameflow-deck/gameflow
Icon=/opt/gameflow-deck/icon.png
Type=Application
Categories=Game;
EOF
}
