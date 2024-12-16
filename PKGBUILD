# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='hyprgui'
pkgname="$_pkgname-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "$_pkgname-$pkgver.png::$_url_raw/refs/tags/v$pkgver/$_pkgname.png"
    "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/v$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('329227ff3f16de6d68d427b3837068582d0648fc8882603a5da6588f4e2058ad'
            'ccc2881eba57c0729032fb2d4f54bc7b819ea741fb44961314d5ddff5bdfb263'
            '1e215a26e4c976e53057b6972811ca16fa74631a0a67452dabb23f639c6194fc'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '477556adfd263655fb9b6c1d462adde73352157d1a92dde804cd58e3190dead3')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprland')
conflicts=($_pkgname)
provides=($_pkgname)

prepare() {
    echo "Version=$pkgver" >> "$pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname-$pkgver.png" "$pkgdir/usr/share/icons/$_pkgname.png"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
