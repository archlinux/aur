# Maintainer: ChinaNuke <chinanuke@nuke666.cn>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=plasma6-themes-layan-git
pkgver=r86.1eed6f6
pkgrel=1
pkgdesc="A flat Design theme for KDE Plasma6 desktop"
arch=(any)
url="https://github.com/vinceliuice/Layan-kde"
license=('GPL3')
makedepends=('git')
optdepends=('kvantum: Better looking for application styles'
            'tela-icon-theme: Matching icon theme')
provides=('layan-kde-git')
replaces=('layan-kde-git')
conflicts=('layan-kde-git' 'plasma5-themes-layan-git')
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
    cd "$srcdir/${pkgname%-git}/sddm/6.0"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
}

package() {
    # Install aurorae themes, kvantum themes, plasma color schemes, 
    # plasma desktop themes, plasma look-and-feel packages.
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/share"
    ./install.sh

    # Install sddm themes.
    cd "$srcdir/${pkgname%-git}/sddm/6.0"
    install -d "$pkgdir/usr/share/sddm/themes"
    ./install.sh
}
