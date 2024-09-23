# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch
pkgver=4.2.1
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils)
provides=($pkgname=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

backup=("etc/xdg/albafetch.conf")

md5sums=('69e4bd74d0a078afc00e8218c2f43c5e')

build() {
    cd $pkgname-$pkgver
    meson setup build
    meson compile -C build
}

check() {
    echo -e "\e[33m\e[1mTesting every module.\e[0m Feel free to report anything not working on https://github.com/alba4k/albafetch/issues"
    $pkgname-$pkgver/build/debug
}

package() {
    cd $pkgname-$pkgver
    make PKGNAME=$pkgname INSTALLPATH="$pkgdir/usr/bin" CONFIGPATH="$pkgdir/etc/xdg" DATAPATH="$pkgdir/usr/share" install
}

