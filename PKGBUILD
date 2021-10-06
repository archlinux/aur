# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-git
pkgver=0.3.0
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron"
license=('MIT')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
makedepends=('git' 'yarn')
provides=("${pkgname%-git}" 'ms-office-electron')
conflicts=("${pkgname%-git}" 'ms-office-electron')
source=("${pkgname%-git}::git+https://github.com/agam778/MS-Office-Electron.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-git}/MS-Office-Electron-Linux/"
    export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
    yarn install
    yarn electron-builder -l pacman
}

package() {
    ls
    cd "$srcdir/${pkgname%-git}"
    ls
    bsdtar -xf "$srcdir/${pkgname%-git}/MS-Office-Electron-Linux/release/MS-Office-Electron-Setup-0.3.0-x86_64.pacman" -C "$pkgdir"

    install -Dm644 license.txt -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

    sudo ln -sf "/opt/MS Office - Electron/MS Office - Electron" "/usr/bin/MS Office - Electron"

    sudo rm "$pkgdir"/.[^.]*
}

