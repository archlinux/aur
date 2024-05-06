# Maintainer: Eloy Garcia Almaden <eloy.garcia.pca@gmail.com>
# Contributor: gbr <gbr@protonmail.com>
pkgname=wallpaperdownloader
pkgver=4.4.2
pkgrel=0
pkgdesc='Download, manage and change automatically your favorite wallpapers from the Internet'
arch=('any')
url='https://bitbucket.org/eloy_garcia_pca/wallpaperdownloader'
license=('GPL3')
depends=('java-runtime>=8' 'xdg-utils')
makedepends=('java-environment>=8' 'maven')
source=("$pkgname-$pkgver.tar.gz::$url/get/v$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha256sums=('02bcc6f14961b071ff4add31b1ad986c57ebdaaab1b7c9f4ebb9913c004cda02')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -C "$pkgname-$pkgver" -x -f "$pkgname-$pkgver.tar.gz" --strip-components 1
}

build() {
    cd "$pkgname-$pkgver"
    mvn clean package -DpackagingPhase=none
}

package() {
    cd "$pkgname-$pkgver"

    # Complete jar
    install -Dm644 "target/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    # Launching script 
    install -Dm755 "aur/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # .desktop file and icon
    install -Dm644 "aur/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "aur/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
