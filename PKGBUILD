# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=bagh-chal-gui
pkgver=1.0
pkgrel=1
url="https://github.com/moverest/bagh-chal"
pkgdesc="A bagh-chal game with a SDL GUI."
arch=('x86_64')
license=('MIT')
depends=('sdl2' 'sdl2_ttf' 'ttf-fira-sans')
source=("https://github.com/moverest/bagh-chal/archive/$pkgver.tar.gz")
md5sums=('c272cba13e72dde21e5140f5428d4de3')


build() {
    cd "bagh-chal-$pkgver"
    make "build/main_minimalist_sdl"
}

package() {
    cd "bagh-chal-$pkgver"

    bin_dir="$pkgdir/usr/bin"
    mkdir -p "$bin_dir"
    mv "build/main_minimalist_sdl" "$bin_dir/bagh-chal-minimalist-sdl"

    launcher="$bin_dir/bagh-chal-gui"
    echo -e "#!/bin/sh\n/usr/bin/bagh-chal-minimalist-sdl /usr/share/fonts/TTF/FiraSans-Regular.ttf" > "$launcher"
    chmod +x "$launcher"
}
