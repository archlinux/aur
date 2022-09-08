# Maintainer: MartorSkull <livemartor@gmail.com>
_pkgname=cleartouch
pkgname=$_pkgname-git
pkgver=0.1.0.r14.g4c37c64
pkgrel=1
epoch=0
pkgdesc="A touchpad vizualizer written in zig"
arch=('x86_64')
url="https://github.com/canadaduane/cleartouch"
license=('MIT')
depends=(
    'udev'
    'glfw'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxcursor'
)
makedepends=(
    'zig'
    'git'
    )
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname::git+https://github.com/canadaduane/cleartouch.git"
    "clap::git+https://github.com/Hejsil/zig-clap.git#tag=0.5.0"
    "pike::git+https://github.com/cekongnetcv/pike.git"
    "raylib::git+https://github.com/raysan5/raylib.git#commit=e60aa8e9351a3427f1754ef5e83c1f0102223415"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname/lib"
    rm -rf "./clap/" "./pike/" "./raylib/"
    cp -r "$srcdir/clap/" "./clap"
    cp -r "$srcdir/pike/" "./pike"
    cp -r "$srcdir/raylib/" "./raylib"

}

build() {
    cd "$srcdir/$_pkgname"
    zig build -Drelease-small=true
}

package() {
    cd "$srcdir/$_pkgname/zig-out/bin"
    ls
    install -Dm755 "./cleartouch" "$pkgdir/usr/bin/cleartouch"
}
