# Maintainer: North Crescent <north-crescent@tuta.io>

pkgname="mira"
pkgver="0.2.1_beta"
pkgrel="1"
pkgdesc="An abstract workflow assistant for Git"

arch=("any")
url="https://github.com/north-crescent/$pkgname"
license=("GPL3")

depends=("lua>=5.3.0" "luarocks")
install="$pkgname.install"
source=("$pkgname::git+$url.git#tag=${pkgver//_/-}")
md5sums=("SKIP")

package() {
    cd "$pkgname"
    
    local source="$srcdir/$pkgname" target="$pkgdir"
    
    install -D -m "775" "$source/script/mira.lua" "$target/usr/bin/mira"
    
    for module in $source/module/*; do
        install -D -m "644" "$module" "$target/usr/lib/mira/$(basename $module)"
    done
}
