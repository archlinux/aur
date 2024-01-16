# Maintainer: ChinaNuke <chinanuke@nuke666.cn>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=plasma5-themes-layan-git
pkgver=r75.c4cce9d
pkgrel=1
pkgdesc="A flat Design theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/vinceliuice/Layan-kde"
license=('GPL3')
makedepends=('git')
optdepends=('kvantum: Better looking for application styles'
            'tela-icon-theme: Matching icon theme')
provides=('layan-kde-git')
replaces=('layan-kde-git')
conflicts=('layan-kde-git')
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Layan-kde.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
    cd "$srcdir/${pkgname%-git}/sddm"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
}

package() {
    # Install aurorae themes, kvantum themes, plasma color schemes, 
    # plasma desktop themes, plasma look-and-feel packages.
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/share"
    ./install.sh

    # Install sddm themes.
    cd "$srcdir/${pkgname%-git}/sddm"
    install -d "$pkgdir/usr/share/sddm/themes"
    ./install.sh
}
