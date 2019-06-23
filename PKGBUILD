# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gtkada
pkgver=2019
pkgrel=1

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5ce7f58931e87adb2d312c53')
sha1sums=('eac201014c9d51fb36cb8346cec8e90ec51536d0')


build()
{
    cd $srcdir/gtkada-2019-20190424-19D98-src

    export LIBRARY_TYPE=relocatable

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no

    # Disable RPATH usage with -R.
    # Only use a single job (-j1) to prevent the same file being compiled simultaneously
    # which results in build artifacts being overwritten.
    #
    make -j1 PROCESSORS=5 GPRBUILD_SWITCHES=-R
}


package()
{
    cd $srcdir/gtkada-2019-20190424-19D98-src

    make -j1 PROCESSORS=1 DESTDIR="$pkgdir" install
}
