# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gtkada
pkgver=2018
pkgrel=2

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0' 'gtk3' 'freetype2')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b065d07c7a447497530ba7e')
sha1sums=('8f293b3f1b1842566adb8d165f032336fe7aca54')

build()
{
    cd gtkada-gpl-2018-src

    export LIBRARY_TYPE=relocatable

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no

    # Disable RPATH usage with -R.
    # Only use a single job (-j1) to prevent the same file being compiled simultaneously
    # which results in build artifacts being overwritten.
    make -j1 PROCESSORS=1 GPRBUILD_SWITCHES=-R
}

package()
{
    cd gtkada-gpl-2018-src

    make -j1 PROCESSORS=1 DESTDIR="$pkgdir" install
}
