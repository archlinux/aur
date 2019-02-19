# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=fltrdr
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=() #Depends on gcc-libs but we assume you have base and base-devel
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("b29011f687a141cae482983a4f9230861731fed035298e967c004398fa770505");

build(){
    cd "$pkgname-$pkgver"
    mkdir -p "build"
    cd "build"
    cmake ../ -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="release"
    make
}

package(){
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

