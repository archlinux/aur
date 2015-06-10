# Maintainer: Franklyn Tackitt
pkgname=dmenu-xft-mouse-height-fuzzy-history
pkgver=4.5
pkgrel=5
pkgdesc="Dynamic X menu - with xft, mouse, height, history, and fuzzy search support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu' 'dmenu2')
provides=('dmenu')
patches=(dmenu-4.5-xft.diff
         break-fix.diff
         dmenu-4.5-history-fixed.diff
         dmenu-4.5-fuzzy-fixed.diff
         dmenu-4.5-mouse-support.diff
         dmenu-4.5-height-fixed.diff)
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz "${patches[@]}")
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         '0c73d595eb78f159bea83f33bba15e80'
         '6921f9d8aabb53f22adcbf5630dff6b8'
         '8541735789d9810d7020fdba62b72296'
         '71fc82b76c45499fcd46b3754407f59d'
         'eeec3e11ff68f27ebbc3133ad6549f56'
         '53b286e8bd76d9225f365673fafd6083')
prepare() {
	cd $srcdir/dmenu-$pkgver
  for patch in "${patches[@]}"; do
    echo "Patching $patch"
    patch -p1 < "../${patch}"
  done
}
build() {
	cd $srcdir/dmenu-$pkgver
	make
}
package()
{
    cd "$srcdir/dmenu-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
