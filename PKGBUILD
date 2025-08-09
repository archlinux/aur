# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=0.9.11
pkgrel=1
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
makedepends=('qt6-base')
depends=('imagemagick')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/Skatox/kim/archive/refs/tags/"$pkgver".tar.gz)
sha512sums=('da2d0603450ad2979d720512b9585acc5319ca05eeb0337c78f7091c08baad8a5dbf7f8b5bf9f570a6dc00831490a704e5d8d2159a7698a6a91447f8a6d87de3') 
	 
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
