# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprwall'
pkgname='hyprwall-bin'
pkgver=0.1.3
pkgrel=1
optdepends=('hyprland')
pkgdesc='GUI for setting wallpapers with Hyprpaper, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop")
sha256sums=('5115243e88180cbbe2f0feb4e4750d82098b27724ec7fcba7f51695d13775f25' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprpaper' 'swaybg' 'swww' 'wallutils' 'feh')
conflicts=($_pkgname)
provides=($_pkgname)
install="$_pkgname.install"

prepare() {
    local oldinstall=$(cat "$startdir/$install")

    echo -n "optdepends=(" > "$startdir/$install"
    for dep in "${optdepends[@]}"; do
        echo -n "'$dep' " >> "$startdir/$install"
    done

    echo -e ")\n$oldinstall" >> "$startdir/$install"

    echo "Version=$pkgver" >> "$pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
