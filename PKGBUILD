# Maintainer: Tim Lagnese <tim at inept tech>
# Maintainer: Rod Kay     <rodakay5 at gmail com>

pkgname=ada_language_server
pkgdesc='High performance syntactic and semantic engine for the Ada programming language.'
pkgver=24.0w
pkgrel=1
epoch=2

url=https://github.com/AdaCore/ada_language_server
arch=(x86_64)
license=(GPL3)

depends=(libadalang-tools
        gtkada
        libvss
        ada_spawn
        ada-libfswatch
        gpr
        gnatdoc)

makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/als-$pkgver-20230428-16420-src.tar.gz)
b2sums=(f0d031d067bfb91baa032d2d4e6b278b748f51a4372c88c01930a18d6a4033aa0cf153391c5a2f547e20fd1f2c8fbc09df5e49d5071236bbf7f834b0df4abeee)


build()
{
    cd $srcdir/als-24.0w-20230428-16420-src

    make BUILD_MODE=prod all

    export LIBRARY_TYPE=relocatable
    gprbuild gnat/lsp_client_glib.gpr
}


#check() {
#    cd $srcdir/$pkgname-$pkgver
#    make check
#}


package()
 {
    cd $srcdir/als-24.0w-20230428-16420-src

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR=$pkgdir/usr install

    export LIBRARY_TYPE=relocatable
    gprinstall --prefix=$pkgdir/usr -p gnat/lsp_client_glib.gpr
}