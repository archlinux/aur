# Maintainer: Daniil T <contact.2imt@mail.ru>
pkgname="polycat"
pkgver="1.2.0"
pkgrel=2
epoch=
pkgdesc="Runcat module for Polybar"
arch=("x86_64")
url="https://github.com/2IMT/polycat.git"
license=("MIT")
groups=()
depends=()
makedepends=("cmake" "clang" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/nlohmann/json.git#tag=v3.11.2"
        "git+https://github.com/p-ranav/argparse.git#tag=v2.9")
noextract=()
md5sums=('SKIP'
        'SKIP'
        'SKIP')
validpgpkeys=()

build() {
    export CC=clang
    export CXX=clang++
    cd  $pkgname
    git submodule init
    git config submodule.dep/nlohmann-json.url "$srcdir/json"
    git config submodule.dep/argparse.url "$srcdir/argparse"
    git -c protocol.file.allow=always submodule update
    cmake -DCMAKE_BUILD_TYPE=RELEASE .
    cmake --build .
}

package() {
    cd $pkgname

    install -DTm755 "$pkgname" "$pkgdir/usr/bin/polycat"

    chmod 644 "res/$pkgname.ttf"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp "res/$pkgname.ttf" "$pkgdir/usr/share/fonts/TTF/$pkgname.ttf"
}
