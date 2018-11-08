# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks-git
pkgver=r102.4d6e08e
pkgrel=4
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
conflicts=('gtk-theme-adwaita-tweaks')
provides=('gtk-theme-adwaita-tweaks')
makedepends=('git')
source=('git+https://github.com/Jazqa/adwaita-tweaks.git'
        'adwaita-tweaks-dark::git+https://github.com/Jazqa/adwaita-tweaks.git#branch=dark')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd adwaita-tweaks
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "adwaita-tweaks/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"{,\ Dark}
    find . -name COPYING -name README.md -exec rm {} +
    cp -r adwaita-tweaks/* "$pkgdir/usr/share/themes/Adwaita Tweaks"
    cp -r adwaita-tweaks-dark/* "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
    find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
