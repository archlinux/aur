# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=zthread
_pkgname=ZThread
pkgver=2.3.2
pkgrel=2
pkgdesc='A platform-independent, multi-threading and synchronization library for C++'
arch=('i686' 'x86_64')
url='http://zthread.sourceforge.net/'
license=('MIT')
depends=(bash)
makedepends=('automake=1.7')
options=(!emptydirs libtool)
source=("$pkgname-$pkgver.tar.gz::http://prdownloads.sourceforge.net/zthread/ZThread-${pkgver}.tar.gz"
zthread.patch
https://raw.github.com/freddix/pkgs.old/master/ZThread/ZThread-destdir.patch
)
sha256sums=('950908b7473ac10abb046bd1d75acb5934344e302db38c2225b7a90bd1eda854'
            'd0c996aad95f90d7465171b184c0f062145e8b0bea7a74df9ddc2e659f3f13f4'
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
