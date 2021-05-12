# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: jperry <sh.jperry@gmail.com>

pkgname=gworkspace
pkgver=0.9.4
pkgrel=2
pkgdesc="The GNUstep Workspace"
arch=("x86_64")
url="http://www.gnustep.org/experience/GWorkspace.html"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(gworkspace)
conflicts=(gworkspace)
source=(ftp://ftp.gnustep.org/pub/gnustep/usr-apps/$pkgname-$pkgver.tar.gz
        Update-Scaling-code-to-Bilinear-from-PRICE.patch
        multiple-definition-of-serverConnection-fix.patch
        Fix-incompatible-pointer-types-compiler-warning.patch
        compare-pointer-against-nil-and-not-NO.patch)
md5sums=('406256f470781bc3be2670611276780f'
         '731741597a4aa46352b53f3935d3e711'
         'e6bc341f8f71ab8090d455bb1f3d9abf'
         '87adfcb5ba03bfc37150faf779421c28'
         '5cad37d585ef234dcd4bfc4d7d2d8f9c')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../Update-Scaling-code-to-Bilinear-from-PRICE.patch
  patch -p1 -i ../multiple-definition-of-serverConnection-fix.patch
  patch -p1 -i ../Fix-incompatible-pointer-types-compiler-warning.patch
  patch -p1 -i ../compare-pointer-against-nil-and-not-NO.patch
} 
build() {
  cd $srcdir/$pkgname-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/opt/GNUstep
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR=$pkgdir install
}