# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=0.9.10
pkgrel=3
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
makedepends=('qt6-base')
depends=('imagemagick')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/Skatox/kim/archive/refs/tags/"$pkgver".tar.gz)
sha512sums=('9f47523e75e14ec518218870070a5cc617e8a5680f4a07455997c78c9d2c2d15cae09d46ace92abe221b9bcd0765a65607ceac30bbb7bdbf42f593dadd0a508e') 
	 
package() {
  cd "$srcdir/kim-$pkgver"

  kdeinstdir="$pkgdir$(qmake6 -query QT_INSTALL_PREFIX)"
  
  # Creates required folders 
  mkdir -p "$kdeinstdir/share/apps/kim/"
  mkdir -p "$kdeinstdir/share/kio/servicemenus/"
  mkdir -p "$kdeinstdir/share/locale/"
  mkdir -p "$kdeinstdir/bin"

  # Copy programs to their respective folders
  cp src/kim*.desktop "$kdeinstdir"/share/kio/servicemenus
  cp src/bin/kim* "$kdeinstdir"/bin/
  chmod a+rx "$kdeinstdir"/bin/kim*
  chmod a+r "$kdeinstdir"/share/kio/servicemenus/kim*.desktop
  
  cp language/kim.pot "$kdeinstdir"/share/apps/kim/
  cp -Rf language/locale/* "$kdeinstdir"/share/locale/
  cp -Rf src/slideshow "$kdeinstdir/share/apps/kim/"
  cp -Rf src/gallery "$kdeinstdir/share/apps/kim/"
}
