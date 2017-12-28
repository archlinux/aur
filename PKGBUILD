# Maintainer: Heorhi Valakhanovich <valahanovich@tut.by>

pkgname=('dlangide-git')
pkgver=r772.582feea
pkgrel=1
pkgdesc="D language IDE based on DlangUI "
arch=('i686' 'x86_64')
url="https://github.com/buggins/dlangide"
license=("BSL")
groups=('dlang')
depends=('dtools')
makedepends=('dmd' 'dub' 'git')
conflicts=('dlangide')

source=(
  "git+https://github.com/buggins/dlangide.git"
  dlangide.desktop
  dlangide.install
)
sha256sums=('SKIP'
            'dc3b72ef22bec75722266497f398b87a057b44b9add7dbf1ca1140521d553efa'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e')


pkgver() {
  cd $srcdir/dlangide
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/dlangide
	dub build --build=release
}

package() {
	# binary
	mkdir -p $pkgdir/usr/bin
	install -m755 \
		$srcdir/dlangide/bin/dlangide \
		$pkgdir/usr/bin/dlangide
	# license
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 $srcdir/dlangide/LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# icon
	mkdir -p $pkgdir/usr/share/applications
	install -m644 $srcdir/dlangide.desktop \
		$pkgdir/usr/share/applications/dlangide.desktop
	mkdir -p $pkgdir/usr/share/pixmaps
	install -m644 \
		$srcdir/dlangide/views/res/mdpi/dlangui-logo1.png \
		$pkgdir/usr/share/pixmaps/dlangui-logo1.png
}
