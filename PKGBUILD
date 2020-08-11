# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=2.0.1
pkgrel=1
pkgdesc="World of Warcraft addon manager. F/OSS, ad-free and privacy respecting."
arch=("x86_64")
url="https://github.com/ogri-la/strongbox"
license=("AGPL")
depends=("java-runtime")
provides=("$pkgname")
conflicts=("$pkgname")
replaces=("wowman")
# e.g.: "https://github.com/ogri-la/strongbox/releases/download/1.2.3/strongbox-1.2.3-standalone.jar"
source=("https://github.com/ogri-la/strongbox/releases/download/$pkgver/$pkgname-$pkgver-standalone.jar")
noextract=("$pkgname-$pkgver-standalone.jar")
sha256sums=("83f740b9c47305dac94eae0695688e7c0954b067c75dd919bc2c7476bb73e89e")

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
