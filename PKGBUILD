# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=0.9.10
pkgrel=2
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
makedepends=('qt6-base')
depends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Skatox/kim/archive/refs/tags/$pkgver.tar.gz" install.sh.patch)
sha512sums=('9f47523e75e14ec518218870070a5cc617e8a5680f4a07455997c78c9d2c2d15cae09d46ace92abe221b9bcd0765a65607ceac30bbb7bdbf42f593dadd0a508e' '666479a5df956b02ac57f102c2ca306caa864f6b93913e5a6e5829f83ae7093d4a0246aa7bf8de522a7a81435d9533cb6984769a458cd22f99928a21c48351da')
	 
package() {
  cd "$srcdir/kim-$pkgver"
  patch -Np0 -i "$srcdir/install.sh.patch" || return 1

  export _prefix=$pkgdir
  kdeinstdir="$pkgdir$(qmake6 -query QT_INSTALL_PREFIX)"
  mkdir -p "$kdeinstdir/share/kio/servicemenus/"
  mkdir -p "$kdeinstdir/share/locale/"
  mkdir -p "$kdeinstdir/bin"
  "$srcdir/kim-$pkgver/install.sh" 

  export _prefix='' 
}
