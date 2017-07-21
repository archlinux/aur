pkgname=newmat  
pkgver=10
pkgrel=1
pkgdesc="C++ matrix library"
url="http://www.robertnz.net"
arch=('i686' 'x86_64')
license=('custom')
source=("http://www.robertnz.net/ftp/$pkgname$pkgver.tar.gz" filelist)
md5sums=('c78aab80613db1989d1ec4c525d9d69c'
         '1257a4599e437254666aeac610b7d5c5')
options=('staticlibs')

prepare() {
  sed -i 's+//#define use_namespace+#define use_namespace+' include.h 
}

build() {
  make -f nm_gnu.mak
}

package() {
  for _i in `cat filelist | awk '{print $1}'`
  do
    install -Dm644 ${_i} $pkgdir/usr/include/$pkgname/${_i}
  done
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/README
  install -Dm644 libnewmat.a $pkgdir/usr/lib/libnewmat.a 
  for _i in `cat filelist | awk '{print $1}'|sed s+.cpp+.o+|grep -v .h`
  do 
    install -Dm755 ${_i} $pkgdir/usr/lib/$pkgname/${_i}
  done  
  install -Dm644 nm10.htm $pkgdir/usr/share/doc/$pkgname/nm10.htm
}
