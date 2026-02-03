# Maintainer: nelle the@nelle.observer

pkgname=packwitch-manager-git
pkgver=0.1a
pkgrel=1
pkgdesc="minecraft modpack management tool"
arch=('x86_64')
url="https://codeberg.org/packwitch/packwitch"
license=('LGPL 3.0+')
depends=('jdk21-openjdk')
makedepends=(
    'git'
    'jdk21-openjdk'
)

source=("git+https://codeberg.org/packwitch/packwitch")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/packwitch"
    git rev-parse --short HEAD || printf "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/packwitch"
    $srcdir/packwitch/gradlew :manager:assembleDist
}

package() {
    cd "$srcdir/packwitch/manager/build/distributions/"

    tar -xf manager-*.tar

    cd manager-*/

    mv bin/manager bin/packwitch
    rm bin/manager.bat

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -r bin/* "$pkgdir/usr/bin/"
    cp -r lib/* "$pkgdir/usr/lib/"
}
