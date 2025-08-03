# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=0.9.10
pkgrel=1
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
makedepends=('qt6-base')
depends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Skatox/$pkgname/archive/refs/tags/$pkgver.tar.gz" install.sh.patch)
sha512sums=('c866c8b9e79116336b448c84f19c8ddd05def74f979fa4d9ebcb5f455aaffda6e6a7513e73a19c98300a58dd4c852388f762cc38bdd14112a01e89d3169cd998' '666479a5df956b02ac57f102c2ca306caa864f6b93913e5a6e5829f83ae7093d4a0246aa7bf8de522a7a81435d9533cb6984769a458cd22f99928a21c48351da')
	 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/install.sh.patch" || return 1

  export _prefix=$pkgdir
  kdeinstdir="$pkgdir$(qmake6 -query QT_INSTALL_PREFIX)"
  mkdir -p "$kdeinstdir/share/kio/servicemenus/"
  mkdir -p "$kdeinstdir/share/locale/"
  mkdir -p "$kdeinstdir/bin"
  "$srcdir/$pkgname-$pkgver/install.sh" 

  export _prefix='' 
}
