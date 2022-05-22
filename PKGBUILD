# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newmat  
pkgver=10E
pkgrel=1
epoch=1
pkgdesc="C++ matrix library"
url="http://www.robertnz.net"
arch=('i686' 'x86_64')
license=('custom')
source=("http://www.robertnz.net/ftp/$pkgname${pkgver%E}.tar.gz" filelist)
sha256sums=('637d18c0363b8bb99c48eb04cce8c182ccbff771df0bf1e2d541e95f6eb34e7b'
            'b707dfdf6f64c7bcea1f288845b967349aaa76b6b8fb43559138a9f70307ceee')
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
    install -Dm644 ${_i} "$pkgdir"/usr/include/$pkgname/${_i}
  done
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/README
  install -Dm644 libnewmat.a "$pkgdir"/usr/lib/libnewmat.a 
  for _i in `cat filelist | awk '{print $1}'|sed s+.cpp+.o+|grep -v .h`
  do 
    install -Dm755 ${_i} "$pkgdir"/usr/lib/$pkgname/${_i}
  done  
  install -Dm644 nm10.htm "$pkgdir"/usr/share/doc/$pkgname/nm10.htm
}
