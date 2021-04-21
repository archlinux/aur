# Maintainer: Xnopyt <billy@xnopyt.info>
pkgname="gmad-git"
pkgver=v1.1
pkgrel=2
pkgdesc="Garry's Mod Addon Creator and Extractor"
arch=( "x86_64" )
url="https://github.com/garrynewman/gmad"

makedepends=( "premake" )
provides=( "gmad" )

source=("gmad::git+https://github.com/Facepunch/gmad.git#branch=master"
        "bootil::git+https://github.com/garrynewman/bootil.git#branch=master")

md5sums=("SKIP"
        "SKIP")

build() {
    cd "$srcdir/bootil/projects"
    premake5 gmake
    make config=release_x64
    cd "$srcdir/gmad"
    premake5 --outdir="bin/" --bootil_lib="$srcdir/bootil/projects/release_x64_linux" --bootil_inc="$srcdir/bootil/include/" gmake
    make
}

package() {
    install -Dm755 $srcdir/gmad/bin/gmad_linux "$pkgdir"/usr/bin/gmad
}
