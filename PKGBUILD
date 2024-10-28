# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprwall'
pkgname='hyprwall-bin'
pkgver=0.1.6
pkgrel=2
optdepends=('hyprland')
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/man/$_pkgname.1"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.svg"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop")
sha256sums=('1e60f4d5308e8edaaa7f1ee14f4ec749af31eb7478ab0e5ec5e7468ef0b81f37' 'SKIP' 'SKIP' 'SKIP')
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

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "$_pkgname.svg" "$pkgdir/usr/share/icons/$_pkgname.svg"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
