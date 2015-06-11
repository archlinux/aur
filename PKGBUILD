# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=chm-thumbnailer
pkgver=1.2
pkgrel=3
pkgdesc="CHM thumbnailer for GNOME desktop"
arch=('i686' 'x86_64')
url=('https://bbs.archlinux.org/viewtopic.php?pid=846033')
license=('GPL')
depends=('chmlib' 'gdk-pixbuf2' 'libxml2' 'gconf' 'desktop-file-utils')
source=("$pkgname.c" "$pkgname.thumbnailer")
md5sums=('e6d56e78454d650553edbdaeedfa7878'
         '7c0d9df8b2c96692ae479d124bf65a6b')

build()
{
    cd "$srcdir"
    gcc -o $pkgname $CFLAGS $pkgname.c \
        `xml2-config --cflags` \
        `pkg-config --cflags gdk-pixbuf-2.0` \
        `pkg-config --cflags gio-2.0` \
        `xml2-config --libs` \
        `pkg-config --libs gdk-pixbuf-2.0` \
        `pkg-config --libs gio-2.0` \
        -lchm $LDFLAGS
}

package()
{
    install -m 755 -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m 644 -D "$srcdir/$pkgname.thumbnailer" \
        "$pkgdir/usr/share/thumbnailers/$pkgname.thumbnailer"
}
