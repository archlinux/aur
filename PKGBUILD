#Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=shellex
pkgdesc='zsh/urxvt based program launcher'
url='https://github.com/Merovius/shellex/blob/master/doc/autoresize.txt'
pkgver=0.3
pkgrel=1
arch=('i686' 'x86_64')
license=(BSD)
depends=(
	zsh
	rxvt-unicode
	perl-x11-protocol
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Merovius/shellex/archive/$pkgver.tar.gz"
	"conf.mk.patch"
)
sha512sums=(
	'6c98a982ffcb13ecb7d2ef883799512644ef0c3ba38105caae4206eb163bb587c2fa876963c3313ab8419919c4722bbddc0168a258986ca9913a400e996a2bd6'
	'a38b6e9104aa2bcf28e16ea495eb440a201c00145044910e0ec55201a3fe983df18eeb17fb2c1f4e668d9e27aa8bcf7f6d46e7394f4bf49abb65aaaec8a1b0cc'
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch < "$srcdir/conf.mk.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
	install -D -m 755 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/shellex/LICENSE"
}
