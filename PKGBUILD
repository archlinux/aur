# Maintainer: DaZ <daz.root+arch@gmail.com>

pkgname=gnvim-git
url="https://github.com/vhakulinen/gnvim"
pkgdesc="GUI for neovim, without any web bloat"
pkgver=r193.4f7c547
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
depends=('neovim' 'gtk3' 'webkit2gtk')
makedepends=('git' 'cargo' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/vhakulinen/gnvim.git")
md5sums=('SKIP')

check() {
    cd "$srcdir/${pkgname}"
    cargo test
}

prepare() {
    cd "$srcdir/${pkgname}"
    sed -i s';/usr/local/share/gnvim/runtime;/usr/share/gnvim/runtime;' src/main.rs
}

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    make
}

package() {
    cd "$srcdir/${pkgname}"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
