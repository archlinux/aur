# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gnochm
pkgver=0.9.11
pkgrel=3
pkgdesc="CHM file viewer for GNOME"
arch=('i686')
url="http://gnochm.sourceforge.net/"
license=('GPL')
depends=('python2-pychm' 'python2-gconf' 'python2-gtkhtml2' 'python2-libgnome' 'libgtkhtml' 'gconf>=2.18.0.1-4')
source=("http://sourceforge.net/projects/gnochm/files/gnochm/0.9.11/gnochm-0.9.11.tar.gz" "Makefile.patch")

build() {
 cd $srcdir/${pkgname}-${pkgver}
 ./configure --prefix=/usr
 make
 sed -i '1s/$/2/' gnochm
 patch -p0 < $srcdir/Makefile.patch data/Makefile
}

package() {
 cd $srcdir/${pkgname}-${pkgver}
 make DESTDIR=${pkgdir} install
 sed -i 's/\.png//' $pkgdir/usr/share/applications/gnochm.desktop
}
md5sums=('d77cc819eaa64b3ab333c4a73e88cfc0'
         '2a650f7efaa58550ecb3e96753266c1e')
