# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=fltrdr
pkgver=0.3.1
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=("icu" "openssl>=1.1.0") #Depends on gcc-libs but we assume you have base and base-devel
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a52cf4eb41a37e330fe1e1687efab1e3e2bd78c673ca3576283ad68788fdd6eb')

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

