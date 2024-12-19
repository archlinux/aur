# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.10.31
pkgrel=2
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('MIT')
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname"
    "$_pkgname-$pkgver.1::$_url_raw/refs/tags/$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$_url_raw/refs/tags/$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/$pkgver/README.md")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname-aarch64"
    "$_pkgname-$pkgver.1::$_url_raw/refs/tags/$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$_url_raw/refs/tags/$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/$pkgver/README.md")
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums_x86_64=('f6942b5bdcfc770f4853c50669146d9332415169f6f5ea6caa8b9dfc221ead1e' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_aarch64=('0' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    echo "Version=$pkgver" >> "$_pkgname-$pkgver.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname-$pkgver.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
