# Maintainer: tuberry

_srcname="lakeside-dynamic-wallpaper"
pkgname=gnome-backgrounds-lakeside-git
pkgver=r3.88323e3
pkgrel=1
pkgdesc="Beautiful dynamic lakeside wallpaper for Gnome"
url="https://github.com/dbasinge/${_srcname}"
depends=("gnome-backgrounds")
makedepends=("git")
provides=("gnome-backgrounds-lakeside")
license=("unknown")
arch=("any")
source=("git+${url}")
md5sums=("SKIP")

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_srcname}

    install -dm755 ${pkgdir}/usr/share/backgrounds/Lakeside
    for file in Lakeside/*; do
        if [[ "$file" == *"preview"* ]]; then
            continue;
        fi
        install -Dm644 $file ${pkgdir}/usr/share/backgrounds/Lakeside
    done

    install -Dm644 desktop-backgrounds-lakeside.xml ${pkgdir}/usr/share/gnome-background-properties/lakeside.xml
}
