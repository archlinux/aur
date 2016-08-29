# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=openfx-arena
pkgver=2.1.2
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/olear/openfx-arena/tree/Natron-$pkgver"
license=("GPL2")
makedepends=("git")
depends=("gcc-libs-multilib" "imagemagick" "libcdr" "librsvg" "libtool" "libzip" "opencolorio" "poppler-glib")
source=("$pkgname::git://github.com/olear/openfx-arena.git#tag=Natron-$pkgver" "GCC6.patch")
md5sums=("SKIP" "8da02f30c37861eaaac9245ff4cb005b")

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update -i --recursive
    cd "OpenFX"
    #note : patch is only useful for 2.1.2 & lower. should be fixed in next release
    patch -uNp1 -i $srcdir/GCC6.patch
}

build() {
    cd "$srcdir/$pkgname"
    make CONFIG=release
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/OFX/Plugins"
    make install PLUGINPATH=$pkgdir/usr/OFX/Plugins CONFIG=release
}
