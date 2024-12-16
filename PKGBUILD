# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='hyprwall'
pkgname="$_pkgname-bin"
pkgver=0.1.9
pkgrel=1
optdepends=('hyprland')
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "$_pkgname-$pkgver.1::$_url_raw/refs/tags/v$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.png::$_url_raw/refs/tags/v$pkgver/$_pkgname.png"
    "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/v$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('8592e21a453643c9e9e22a47341595fa6c02f803aa153d58def503284fcb8f66' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprpaper' 'swaybg' 'swww' 'wallutils' 'feh')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$_pkgname.install"

prepare() {
    local oldinstall=$(cat "$install")

    echo -n "optdepends=(" > "$install"
    for dep in "${optdepends[@]}"; do
        echo -n "'$dep' " >> "$install"
    done

    echo -e ")\n$oldinstall" >> "$install"

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
