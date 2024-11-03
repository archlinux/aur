# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprwall'
pkgname='hyprwall-bin'
pkgver=0.1.8
pkgrel=1
optdepends=('hyprland')
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/man/$_pkgname.1"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.png"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop")
sha256sums=('2b55eea2ac096dddd9c9d17871b517842c03be94f87d8ac15ee685008d5da5ab' 'SKIP' 'SKIP' 'SKIP')
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
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
