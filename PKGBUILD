# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks-git
pkgver=r102.4d6e08e
pkgrel=2
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
conflicts=('gtk-theme-adwaita-tweaks')
provides=('gtk-theme-adwaita-tweaks')
makedepends=('git')
source=('git://github.com/Jazqa/adwaita-tweaks.git')
sha256sums=('SKIP')

pkgver() {
    cd adwaita-tweaks
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "adwaita-tweaks/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
    rm -rf adwaita-tweaks/{COPYING,README.md}
    cp -r adwaita-tweaks/* "$pkgdir/usr/share/themes/Adwaita Tweaks"
    find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
