# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='hyprwall'
pkgname="$_pkgname-bin"
pkgver=0.1.8
pkgrel=2
optdepends=('hyprland')
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "$_pkgname-$pkgver.1::$url_raw/refs/tags/v$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.png::$url_raw/refs/tags/v$pkgver/$_pkgname.png"
    "$_pkgname-$pkgver.desktop::$url_raw/refs/tags/v$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('2b55eea2ac096dddd9c9d17871b517842c03be94f87d8ac15ee685008d5da5ab' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprpaper' 'swaybg' 'swww' 'wallutils' 'feh')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$_pkgname.install"

prepare() {
    local oldinstall=$(cat "$startdir/$install")

    echo -n "optdepends=(" > "$startdir/$install"
    for dep in "${optdepends[@]}"; do
        echo -n "'$dep' " >> "$startdir/$install"
    done

    echo -e ")\n$oldinstall" >> "$startdir/$install"

    echo "Version=$pkgver" >> "$pkgname-$pkgver.desktop"
}

package() {
    cd "$srcdir"
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname-$pkgver.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "$_pkgname-$pkgver.png" "$pkgdir/usr/share/icons/$_pkgname.png"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
