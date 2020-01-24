# Maintainer: Franklyn Tackitt
pkgname=dmenu-xft-mouse-height-fuzzy-history
pkgver=4.9
pkgrel=3
pkgdesc="Dynamic X menu - with xft, mouse, height, history, and fuzzy search support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu' 'dmenu2')
provides=('dmenu')
patches=(dmenu-history-fixed-4.9.diff  
         dmenu-fuzzymatch-4.9.diff
         dmenu-mousesupport-4.7.diff
		 dmenu-lineheight-4.9.diff)
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz "${patches[@]}")
sha256sums=('b3971f4f354476a37b2afb498693649009b201550b0c7c88e866af8132b64945'
            '480dae5b4d18198d887c8ea02758e03d55da04db5a6afb43f086e68f75a41b4c'
            'd9a1e759cd518348fc37c2c83fbd097232098562ebfd1edf85b51413ff524b79'
            '084aa281c92bf87103121a031617c3ec10ee63ce40f955aefafc5dbded9489e5'
            'ff4af5c72908f2f504ce480ada6462c9583c31eab7cabfb690c9528e4924389a')
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
