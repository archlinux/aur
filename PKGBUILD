# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Adam Wolk <netprobe@gmail.com>

pkgname=revit
pkgver=20070804
pkgrel=3
pkgdesc='A file carving tool for recovery and forensics'
url='https://github.com/libyal/reviveit'
license=('custom')
arch=('i686' 'x86_64')
depends=('openssl' 'file')
optdepends=('libewf: Support for Expert Witness Compression Format (EWF)')
options=(!libtool)
source=(https://c70f42b85bd16a3cde2c01fb0fba7562a16d22fd.googledrive.com/host/0B3fBvzttpiiSXzFYdm55enhGLU0/${pkgname}07-alpha-$pkgver.tar.gz 
        $pkgname.patch)

build() {
   cd $srcdir/${pkgname}07-$pkgver
   patch -p1 -i $startdir/$pkgname.patch || return 1
   ./configure --prefix=/usr --sysconfdir=/etc/$pkgname || return 1
   make || return 1
}

package () {
   cd $srcdir/${pkgname}07-$pkgver
   make DESTDIR=$pkgdir install || return 1

   install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
   cp etc/* $pkgdir/etc/$pkgname/
}

md5sums=('3a6edb1f5a581c180ae70ee2f2982f27'
         '9cfbdd744c6ebaab732cc28d26240b7c')
