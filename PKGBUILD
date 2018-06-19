# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=zthread
_pkgname=ZThread
pkgver=2.3.2
pkgrel=3
pkgdesc='A platform-independent, multi-threading and synchronization library for C++'
arch=('i686' 'x86_64')
url='http://zthread.sourceforge.net/'
license=('MIT')
depends=(bash)
makedepends=('automake=1.7')
options=(!emptydirs libtool)
source=("$_pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/zthread/files/ZThread/2.3.2/ZThread-2.3.2.tar.gz"
zthread.patch
https://raw.github.com/freddix/pkgs.old/master/ZThread/ZThread-destdir.patch
)
sha256sums=('950908b7473ac10abb046bd1d75acb5934344e302db38c2225b7a90bd1eda854'
            'c5f5894386ab06aa40dd45c25c2cdc4babe09c48b43ad2db43bcb3e692b8216b'
            '67401dc12da4f96d598689aa8aa0f2caa9e6a82a31cad62f0d6d9a3eb7fdbb6c')
prepare(){
  cd "$srcdir"/$_pkgname-$pkgver
  patch -p1 -i $srcdir/zthread.patch
  patch -p1 -i $srcdir/ZThread-destdir.patch
}
build(){
  cd "$srcdir"/$_pkgname-$pkgver
  CXXFLAGS+=' -fpermissive'
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -Dm644 MIT.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
