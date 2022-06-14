# Maintainer: Camber Huang <camber@poi.science>
pkgname=openixcard
pkgver=1.1.0
pkgrel=1
pkgdesc="Open Source Version of Allwinner PhoenixCard on Linux"
arch=("x86_64")
url="https://github.com/YuzukiTsuru/OpenixCard"
license=('GPL')
groups=()
depends=('glibc' 'confuse')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/YuzukiTsuru/OpenixCard.git#tag=1.1.0"
        "git+https://github.com/YuzukiTsuru/ColorCout.git"
        "git+https://github.com/p-ranav/argparse.git"
        "git+https://github.com/arun11299/cpp-subprocess.git"
        "git+https://github.com/ArthurSonzogni/FTXUI.git"
        "git+https://github.com/SemaiCZE/inicpp.git"
        )
noextract=()
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    pushd $pkgname-$pkgver
        git submodule init
        git config submodule.lib/ColorCout.url "$srcdir/ColorCout"
        git config submodule.lib/argparse.url "$srcdir/argparse"
        git config submodule.lib/cpp-subprocess.url "$srcdir/cpp-subprocess"
        git config submodule.lib/ftxui.url "$srcdir/FTXUI"
        git config submodule.lib/inicpp.url "$srcdir/inicpp"
        git submodule update
        pushd lib/argparse
            #git checkout 95d4850 include/argparse/argparse.hpp
        popd
    popd
}

build() {
    cmake -B build -S $pkgname-$pkgver \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
