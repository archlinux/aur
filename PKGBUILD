# Maintainer: Your Name <youremail@domain.com>
_pkgname=kde-gruvbox
pkgname=kdeplasma-themes-${_pkgname}-git
pkgver=r6.2dd9528
pkgrel=4
pkgdesc="A suite of themes for KDE applications that match the retro gruvbox colorscheme"
arch=(any)
url="https://github.com/printesoi/kde-gruvbox"
license=(MIT)
depends=(plasma-workspace)
makedepends=(git)
optdepends=()
provides=(kde-gruvbox)
conflicts=(kde-gruvbox)
source=("git+https://github.com/printesoi/kde-gruvbox.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    rm ./*/README.md
    rm ./yakuake/TODO
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/konsole
    cp -r konsole/* $pkgdir/usr/share/konsole
    install -dm755 $pkgdir/usr/share/apps/yakuake/kns_skins
    cp -r yakuake/breeze-gruvbox-dark $pkgdir/usr/share/apps/yakuake/kns_skins
    install -dm755 $pkgdir/usr/share/color-schemes
    cp color-schemes/Gruvbox.colors $pkgdir/usr/share/color-schemes
    install -dm755 $pkgdir/usr/share/plasma/desktoptheme
    cp -r plasma5/gruvbox $pkgdir/usr/share/plasma/desktoptheme
}
