# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=fltrdr
pkgver=0.1.1
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=() #Depends on gcc-libs but we assume you have base and base-devel
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('154f1766800cc8c140cb89c19340ac4d9784e9d9c77bb5c2b19a6f806e8d98b8')

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

