# Maintainer: Heorhi Valakhanovich <valahanovich@tut.by>

pkgname=('dlangide')
pkgver=0.7.52
pkgrel=1
pkgdesc="D language IDE based on DlangUI "
arch=('i686' 'x86_64')
url="https://github.com/buggins/dlangide"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'dub')

source=(
  "https://github.com/buggins/dlangide/archive/v$pkgver.tar.gz"
  dlangide.desktop
  dlangide.install
)
sha256sums=('67f0208fa2a50158d88994886c46a1e4dfc0bc04fdbebd83f3ec4c26f5833a1b'
            'dc3b72ef22bec75722266497f398b87a057b44b9add7dbf1ca1140521d553efa'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e')

build() {
	cd $srcdir/dlangide-$pkgver
	dub build --build=release
}

package() {
	# binary
	mkdir -p $pkgdir/usr/bin
	install -m755 \
		$srcdir/dlangide-$pkgver/bin/dlangide \
		$pkgdir/usr/bin/dlangide
	# license
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 $srcdir/dlangide-$pkgver/LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# icon
	mkdir -p $pkgdir/usr/share/applications
	install -m644 $srcdir/dlangide.desktop \
		$pkgdir/usr/share/applications/dlangide.desktop
	mkdir -p $pkgdir/usr/share/pixmaps
	install -m644 \
		$srcdir/dlangide-$pkgver/views/res/mdpi/dlangui-logo1.png \
		$pkgdir/usr/share/pixmaps/dlangui-logo1.png
}
