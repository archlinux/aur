# Maintainer: saying <saying121@outlook.com>

pkgname=kali-wallpapers
pkgver=2026.1.0
pkgrel=1
pkgdesc="Kali Linux wallpapers"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-wallpapers"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('0a9b9e8333e4397db03612f552d6e4b7558981ec569a175e530a1e422605757980c381bd0a1e57f0aa15a1dd8b18ec1407409e9d310a08f63f7d13371e071ccb')

build() {
    cd "$pkgname-kali-$pkgver"
    make
}

package() {
    cd "$pkgname-kali-$pkgver"
    install -d -m755 "${pkgdir}/usr/share/"

    local -a wallpaper_dirs=()
    for dir in *; do
        if [ -d "$dir" ]; then
            if [ -d "$dir/backgrounds" ] || [ -d "$dir/gnome-background-properties" ] || [ -d "$dir/wallpapers" ]; then
                wallpaper_dirs+=("$dir")
            fi
        fi
    done

    for dir in "${wallpaper_dirs[@]}"; do
        if [ -d "${dir}" ]; then
            cp -r "${dir}/"* "$pkgdir/usr/share/"
        fi
    done
}
