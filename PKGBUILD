# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=wowman
pkgver=0.9.1
pkgrel=1
pkgdesc="World of Warcraft addon manager. F/OSS, ad-free and privacy respecting."
arch=("x86_64")
url="https://github.com/ogri-la/wowman"
license=("AGPL")
depends=("java-runtime")
provides=("$pkgname")
conflicts=("$pkgname")
# e.g.: "https://github.com/ogri-la/wowman/releases/download/0.9.1/wowman-0.9.1-standalone.jar"
source=("https://github.com/ogri-la/wowman/releases/download/$pkgver/$pkgname-$pkgver-standalone.jar")
noextract=("$pkgname-$pkgver-standalone.jar")
sha256sums=("fbe7608037d9ed8be2b809cd1263e38a19f8743332110904d180cfa4d011aa16")

# following: https://wiki.archlinux.org/index.php/Java_package_guidelines
package() {
    mkdir -p "$pkgdir/usr/share/java/$pkgname"
    mkdir -p "$pkgdir/usr/bin"

    cp "$pkgname-$pkgver-standalone.jar" "$pkgdir/usr/share/java/$pkgname/"

    # a simple executable wrapper around the jar file
    outpath="$pkgdir/usr/bin/$pkgname"
    printf "#!/bin/sh\nexec /usr/bin/java -jar \"/usr/share/java/$pkgname/$pkgname-$pkgver-standalone.jar\" \"\$@\"" > "$outpath"
    chmod +x "$outpath"
}
