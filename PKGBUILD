# Maintainer: Nzeo <archlinux@netzego.de>

pkgname=elfeed2
pkgver=0.3.0
pkgrel=2
pkgdesc="standalone feed reader and successor to elfeed"
arch=('x86_64')
url="https://github.com/skeeto/elfeed2"
license=('Unlicense')
depends=('glibc')
makedepends=('cpp-httplib' 'pugixml' 'sqlite3' 'wxwidgets-gtk3')
source=("https://github.com/skeeto/elfeed2/archive/refs/tags/v0.3.0.tar.gz")
sha256sums=('9c8c2052be7643dd6f4e1da579ccfb76aa5ff342043112a9ef349f5460fb9e3c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    local cmake_options=(
        -B build
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr/bin
        -D DEPS=LOCAL
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
