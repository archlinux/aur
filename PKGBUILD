# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=fltrdr
pkgver=0.3.0
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=("icu" "openssl>=1.1.0") #Depends on gcc-libs but we assume you have base and base-devel
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('dd860b0fdf2ef05245f4b0354a8ce12c75bb8f6112df6d3a6acb4bab099b4c1a')

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

