# Maintainer: Crescent Scroll <crescent-scroll@users.noreply.github.com>

pkgname="auri"
pkgver="0.3.0_beta"
pkgrel="1"
pkgdesc="A way to set up volatile Arch Linux machines"

arch=("any")
url="https://github.com/crescent-scroll/$pkgname"
license=("GPL3")

makedepends=("git")
source=("$pkgname::git+$url.git#tag=${pkgver//_/-}")
md5sums=("SKIP")
install="$pkgname.install"

package() {
    cd "$pkgname"
    
    local source="$srcdir/$pkgname" target="$pkgdir"
    
    cd "$source" && make
    
    install -D -m "755" "$source/binary/auri" "$target/usr/bin/auri"
    
    local initcpio="$target/usr/lib/initcpio"
    
    install -D -m "644" "$source/hook/build.sh" "$initcpio/install/auri"
    install -D -m "644" "$source/hook/run.sh" "$initcpio/hooks/auri"
    
    install -D -m "644" "$source/script/auri.sh" "$target/usr/lib/auri/script"
}
