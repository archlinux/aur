# Maintainer: Moses Miller <Majora320@gmail.com>

pkgname=olympus-bin
pkgver=1891
pkgrel=1
pkgdesc='A mod manager for Celeste'
arch=('x86_64')
url='https://github.com/EverestAPI/Olympus'
license=('MIT')
depends=('love' 'lua51-lsqlite3')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://dev.azure.com/EverestAPI/Olympus/_apis/build/builds/$pkgver/artifacts?artifactName=linux.main&\$format=zip" 'olympus')
noextract=("$pkgname-$pkgver.zip")
sha256sums=('72792ef04d24f76007a832644a0002d8b5be0aaca8c0a29c1deff86b2b6cf429'
            '6122a5b4426700bd9eaf7649ebb213b25ec312727cdb17b4fe87d99e8b380005')

prepare() {
    unzip "$pkgname-$pkgver.zip"
    cd linux.main
    unzip dist.zip
}

package() {
    cd linux.main

    install -Dm755 subprocess.so "$pkgdir/usr/lib/olympus/subprocess.so"
    install -Dm755 nfd.so "$pkgdir/usr/lib/olympus/nfd.so"
    install -Dm755 olympus.love "$pkgdir/usr/lib/olympus/olympus.love"
    install -Dm644 olympus.desktop "$pkgdir/usr/share/applications/olympus.desktop"
    install -Dm644 olympus.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/olympus.png"
    
    cp -r sharp "$pkgdir/usr/lib/olympus/sharp"
    rm "$pkgdir/usr/lib/olympus/sharp/Olympus.Sharp.bin.osx"

    install -Dm755 "$srcdir/olympus" "$pkgdir/usr/bin/olympus"
}
