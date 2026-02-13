# Maintainer: nelle the@nelle.observer

pkgname=packwitch-manager
pkgver=0.1c
pkgrel=2
pkgdesc="minecraft modpack management tool"
arch=('x86_64')
url="https://codeberg.org/packwitch/packwitch"
license=('LGPL-3.0-or-later')
depends=('jdk21-openjdk')
provides=('packwitch-manager')
conflicts=('packwitch-manager')
makedepends=(
    'git'
    'tar'
    'jdk21-openjdk'
)

source=("git+https://codeberg.org/packwitch/packwitch")
sha256sums=('SKIP')

build() {
    cd "$srcdir/packwitch"
    git checkout tags/$pkgver
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
