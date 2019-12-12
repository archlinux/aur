# Maintainer: Xnopyt <billy@xnopyt.info>
pkgname="gmad-git"
pkgver=v1.1
pkgrel=1
pkgdesc="Garry's Mod Addon Creator and Extractor"
arch=( "x86_64" )
url="https://github.com/garrynewman/gmad"

makedepends=( "premake" )
provides=( "gmad" )

source=("gmad::git+https://github.com/garrynewman/gmad.git#branch=master"
        "bootil::git+https://github.com/garrynewman/bootil.git#branch=master")

md5sums=("SKIP"
        "SKIP")

build() {
    cd "$srcdir/bootil/projects"
    premake4 gmake
    cd "$srcdir/bootil/projects/linux/gmake"
    make
    cd "$srcdir/gmad"
    premake4 --outdir="bin/" --bootil_lib="$srcdir/bootil/lib/linux/gmake" --bootil_inc="$srcdir/bootil/include/" gmake
    make
}

package() {
    install -Dm755 $srcdir/gmad/bin/gmad_linux "$pkgdir"/usr/bin/gmad
}