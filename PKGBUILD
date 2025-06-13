# Maintainer: <Fusion916/fusionz916@comcast.net>

pkgname=gtkwave-gtk2-git
pkgver=3.3.116
pkgrel=1
pkgdesc="GTKWave is a fully featured GTK+ based wave viewer for Unix and Win32 which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing"
arch=('x86_64')
url="https://github.com/gtkwave/gtkwave"
license=('GPL2')
depends=('gtk2' 'bzip2' 'judy')
makedepends=('git' 'gcc' 'make' 'gtk2' 'pkg-config' 'gperf')
conflicts=('gtkwave' 'gtkwave-git')
provides=('gtkwave')
source=("git+https://github.com/gtkwave/gtkwave.git#tag=v3.3.116")
sha256sums=('SKIP')

_srcdir=gtkwave/gtkwave3

build() {
    cd $_srcdir
    sed -i 's/{a,b,c,d,e,NULL}/{a,b,(void (*)(void))(c),d,e,NULL}/' src/gtk12compat.h
    sed -i 's/\(gtkwavetcl_[a-zA-Z0-9_]*\)\(}\|,\)/\(int (*)(void)\)\1\2/g' src/tcl_commands.c
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/gtkwave/gtkwave3"  
    make DESTDIR="$pkgdir" install || true
    rm -rf "$pkgdir/usr/share/mime"
}

