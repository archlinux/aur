# Maintainer: atvknox <atvknox@gmail.com>
pkgname=blackarch-xfce-theme-git
pkgver=r15.996cb2d
pkgrel=1
pkgdesc="BlackArch GTK, Xfwm4, and Plank themes for XFCE"
license=('custom:unknown')
arch=('any')
url="https://github.com/BlackArch/blackarch-config-xfce"
makedepends=('git')
provides=('blackarch-xfce-theme')
conflicts=('blackarch-xfce-theme')
source=("git+https://github.com/BlackArch/blackarch-config-xfce.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/blackarch-config-xfce"
    printf "r%s.%s\n" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/blackarch-config-xfce"
    install -dm755 "$pkgdir/usr/share/themes/BlackArch"

    for item in theme/*; do
        [[ ${item##*/} == "BlackArch_Plank_Theme" ]] && continue
        cp -a "$item" "$pkgdir/usr/share/themes/BlackArch/"
    done

    install -dm755 "$pkgdir/usr/share/plank/themes/BlackArch"
    cp -a theme/BlackArch_Plank_Theme/* "$pkgdir/usr/share/plank/themes/BlackArch/"
}
