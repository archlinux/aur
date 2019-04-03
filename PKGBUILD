# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=fltrdr
pkgver=0.2.1
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=("icu") #Depends on gcc-libs but we assume you have base and base-devel
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2e534c7ce3e236e821b4c221b78c9e6b395c2214124139aa2f68cb0c08a70aec')

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

