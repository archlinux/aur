# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: dreamscached <dreamscache.d@gmail.com>

pkgname="recaf"
pkgver=2.21.14
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")

depends=("java-runtime" "jdk-openjdk" "ttf-font")

conflicts=("$pkgname-bin" "$pkgname-git")
replaces=("$pkgname")
provides=("$pkgname")

source=(
    "$pkgname.jar::https://github.com/Col-E/Recaf/releases/download/$pkgver/$pkgname-$pkgver-J8-jar-with-dependencies.jar"
    "$pkgname.png::https://raw.githubusercontent.com/Col-E/Recaf/refs/heads/master/recaf-ui/src/main/resources/icons/logo-full.png"
    "LICENSE::https://raw.githubusercontent.com/Col-E/Recaf/$pkgver/LICENSE"
    "$pkgname"
    "$pkgname.desktop"
)

sha256sums=(
    "8d14fc007e2a90a0d2331e5170cfce0f899ad96631aa7565623dea997c6bcb84"
    "901fbcfa7944e89f5c34e73a3637fd21dc7c8e34b5612a7e0a0a707a4b45be1d"
    "a13cb1a246bc0986c7185510a7ea9880e9f8eaf6d3a0437e2f3f2e2e85e9abb5"
    "046339addc2a51832635838230d7642439cf3f8734508aa2d91c9cf797afc684"
    "a44c16bd628e5066f648fb9dc80ddc36cb94d3d014f487234b4e93c8a9ae7d91"
)

package() {
    cd "$srcdir/"

    sed -i "/^Version=/c\Version=$pkgver" "$pkgname.desktop"
    sed -i "/^Comment=/c\Comment=$pkgdesc" "$pkgname.desktop"

    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -Dm755 "recaf" "$pkgdir/usr/bin/recaf"
    install -Dm755 "$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
