_pkgname=RedPanda-CPP
pkgname=${_pkgname,,}
pkgver=2.23
pkgrel=1
pkgdesc='A fast, lightweight, open source, and cross platform C/C++/GNU Assembly IDE'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/royqh1979/$_pkgname"
license=('GPL3')
depends=(qt5-base qt5-svg gcc gdb)
makedepends=(qt5-tools)
optdepends=(
    'clang: C/C++ compiler (alternative)'
    'git: git integration'
    'alacritty: run in terminal'
    'kitty: run in terminal'
    'tilix: run in terminal'
    'cool-retro-term: run in terminal'
    'konsole: run in terminal'
    'deepin-terminal: run in terminal'
    'qterminal: run in terminal'
    'lxterminal: run in terminal'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/royqh1979/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fc4ea8583a98e83618a90d55a814b8cf8c8ae267f24e122071c219d79bfcb0e3')

build() {
    mkdir redpanda-build
    cd redpanda-build
    qmake \
        PREFIX='/usr' \
        LIBEXECDIR='/usr/lib' \
        XDG_ADAPTIVE_ICON=ON \
        "$srcdir/$_pkgname-$pkgver/Red_Panda_CPP.pro"
    make
}

package() {
    cd redpanda-build
    make INSTALL_ROOT="$pkgdir" install
}
