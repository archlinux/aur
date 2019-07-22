# Maintainer: Franklyn Tackitt
pkgname=dmenu-xft-mouse-height-fuzzy-history
pkgver=4.9
pkgrel=2
pkgdesc="Dynamic X menu - with xft, mouse, height, history, and fuzzy search support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu' 'dmenu2')
provides=('dmenu')
patches=(dmenu-fuzzymatch-4.9.diff
         dmenu-mousesupport-4.7.diff
		 dmenu-lineheight-4.9.diff)
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz "${patches[@]}")
md5sums=('9a537ec9a3a2ce9f08963d66b56cc030'
         '10f1d55f242fd34aae6b72b51fd50915'
         '274972c3f6de489dd00543a6d653b960'
         '0832170eeeec1a70febf641828ddcd17')
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
